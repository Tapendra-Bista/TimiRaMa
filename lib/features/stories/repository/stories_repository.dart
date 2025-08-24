import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/features/stories/model/stories_model.dart';
import 'package:timirama/services/base_repository.dart';

class StoriesRepository extends BaseRepository {
  final ImagePicker _imagePicker = ImagePicker();
  StoriesRepository({FirebaseFirestore? fire});

  //-Image adding to cloudinary
  Future<String?> imagePickerForStories(ImageSource source) async {
    try {
      final image = await _imagePicker.pickImage(source: source);
      if (image != null) return image.path;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<String> uploadStoriesToCloundinary({required String imagePath}) async {
    final cloudinary = CloudinaryPublic(
      AppStrings.cloudName,
      AppStrings.uploadPreset,
    );
    final response = await cloudinary.uploadFile(
      CloudinaryFile.fromFile(
        imagePath,
        resourceType: CloudinaryResourceType.Image,
        folder: "timirama/stories",
        publicId: "${DateTime.now().millisecondsSinceEpoch}",
      ),
    );
    return response.secureUrl;
  }

  // Upload or update user story in Firestore
  Future<void> uploadStoriesToFirebase(StoriesModel model) async {
    final docRef = firestore.collection('stories').doc(model.uid);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      // First time: create new document
      await docRef.set({
        'id': model.uid,
        'containUrl': model.containUrl,
        'createdDate': model.createdDate,
        'userName': model.userName,
        'userImg': model.userImg,
      });
    } else {
      // Existing story: update containUrl and createdDate arrays
      await docRef.update({
        'containUrl': FieldValue.arrayUnion(model.containUrl),
        'createdDate': FieldValue.arrayUnion(model.createdDate),
      });
    }
  }

  // Fetch all stories
  Future<List<StoriesFetchModel>> fetchAllStoriesData() async {
    try {
      final snapshot = await firestore.collection('stories').get();

      return snapshot.docs.map((doc) {
        return StoriesFetchModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      print("Error fetching stories: $e");
      rethrow;
    }
  }
}
