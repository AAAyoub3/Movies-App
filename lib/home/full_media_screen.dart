import 'package:flutter/material.dart';

/// A simple full-screen image viewer.
/// Takes a single [mediaUrl] (String) as argument.
///
/// Example usage:
/// Navigator.push(
///   context,
///   MaterialPageRoute(
///     builder: (_) => FullMediaScreen(mediaUrl: imageUrl),
///   ),
/// );

class FullMediaScreen extends StatelessWidget {
  final String mediaUrl;

  const FullMediaScreen({super.key, required this.mediaUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.network(
            mediaUrl,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          (progress.expectedTotalBytes ?? 1)
                      : null,
                  color: Colors.white,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Text(
                'Failed to load image',
                style: TextStyle(color: Colors.white70),
              );
            },
          ),
        ),
      ),
    );
  }
}
