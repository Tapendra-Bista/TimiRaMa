// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReelShimmerLoader extends StatelessWidget {
  const ReelShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Shimmer background layer
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
        ),

        // Mimic text & profile layout (bottom left)
        Positioned(
          bottom: 20,
          left: 16,
          child: Row(
            children: [
              CircleAvatar(radius: 20, backgroundColor: Colors.white),
              const SizedBox(width: 8),
              Container(width: 80, height: 20, color: Colors.white),
              const SizedBox(width: 8),
              Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xfffbf8f1)),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        // Right-side icons (like, comment, share)
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(width: 30, height: 10, color: Colors.white),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}