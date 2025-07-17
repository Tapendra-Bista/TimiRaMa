import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/services/base_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//--------------------Profile repository ---------------------------------------------
class CreateProfileRepository extends BaseRepository {
  final imgPicker = ImagePicker();
  CreateProfileRepository({FirebaseFirestore? firestore}) {
    this.firestore = firestore ?? FirebaseFirestore.instance;
  }

  Future<void> uploadToFirebase(ProfileModel profile) async {
    try {
      await firestore
          .collection('users')
          .doc(currentUserId)
          .set(profile.toMap());
    } catch (e) {
      debugPrint(
        "Error while uploading profile data to firebase : ${e.toString()}",
      );

      rethrow;
    }
  }

  Future<void> updateLocation(String? city, String? country) async {
    final documentReference = firestore.collection('users').doc(currentUserId);

    // Use a transaction or just fetch the doc directly
    final documentSnapshot = await documentReference.get();
    print("User Location value in updateLocation fun  ${city} and ${country}");
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      print("Current User Location : ${country} and ${city}");
      await documentReference.update({
        'city': city ?? data['city'],
        'country': country ?? data['country'],
      });
    }
  }

  Future<String?> imagePicker() async {
    try {
      final img = await imgPicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (img != null) return img.path;
    } catch (e) {
      debugPrint("Error while picking imaage : : ${e.toString()}");
      rethrow;
    }

    return null;
  }

  Future<String?> uploadToCloudinary(String imagePath) async {
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
      rethrow;
    }
  }
}
