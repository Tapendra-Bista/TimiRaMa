import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/features/reels/model/reel_model.dart';
import 'package:timirama/services/base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';

class AddRepository extends BaseRepository {
  final ImagePicker imagePicker = ImagePicker();
  AddRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  //------------------------Pick Video (reels) From Gallery----------------
  Future<String?> videoPicker() async {
    try {
      final XFile? video = await imagePicker.pickVideo(
        source: ImageSource.gallery,
        maxDuration: Duration(seconds: 15),
      );

      if (video != null) return video.path;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  //--------------------Upload reels to Cloudinary---------------------
  Future<String> postVideoInCloudinary(String videoPath) async {
    try {
      final CloudinaryPublic cloudinary = CloudinaryPublic(
        AppStrings.cloudName,
        AppStrings.uploadPreset,
      );
      final CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          videoPath,
          resourceType: CloudinaryResourceType.Video,
          folder: "timirama/reels",
          publicId: "${DateTime.now().millisecond}",
        ),
      );
      print("Reels video Url is ${response.secureUrl}");
      return response.secureUrl;
    } catch (e) {
      rethrow;
    }
  }

  //------------------create ----------
  Future<void> addToFirebase(ReelModel reelmodel) async {
    await firestore.collection('reels').doc().set(reelmodel.toMap());
  }
}
