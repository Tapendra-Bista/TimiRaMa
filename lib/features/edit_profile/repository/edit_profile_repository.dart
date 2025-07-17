import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/services/base_repository.dart';

class EditProfileRepository extends BaseRepository {
  final ImagePicker _imagePicker = ImagePicker();
  EditProfileRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  Future<String?> pickImage(ImageSource imageSource) async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: imageSource);

      if (image != null) return image.path;
    } catch (e) {
      print("Error in replace of profile pic ${e.toString()}");
      rethrow;
    }

    return null;
  }

  Future<void> replacePicInFirebase(String url) async {
    final collectionReference = firestore
        .collection('users')
        .where('id', isEqualTo: currentUserId);

    final querySnapshot = await collectionReference.get();

    if (querySnapshot.docs.isEmpty) return;

    // Get the document reference
    final docRef = querySnapshot.docs.first.reference;

    // Update the imgURL field
    await docRef.update({'imgURL': url});
  }

  Future<String> uploadToCloudinary(String imagePath) async {
    try {
      final cloudinary = CloudinaryPublic(
        AppStrings.cloudName,
        AppStrings.uploadPreset,
      );
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imagePath,
          resourceType: CloudinaryResourceType.Image,
          folder: "timirama/images",
          publicId: "${DateTime.now().millisecond}",
        ),
      );

      return response.secureUrl;
    } catch (e) {
      print("Error in replace of profile pic ${e.toString()}");
      rethrow;
    }
  }
}
