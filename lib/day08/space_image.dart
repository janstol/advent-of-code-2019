class SpaceImage {
  final List<SpaceImageLayer> layers = [];
  final int width;
  final int height;

  SpaceImage({String input, this.width, this.height}) {
    _load(input);
  }

  List<int> decode() {
    final List<int> image = List<int>.filled(width * height, 2);

    for (final layer in layers) {
      for (int i = 0; i < image.length; i++) {
        if (image[i] > 1) {
          image[i] = layer.pixels[i];
        }
      }
    }
    return image;
  }

  @override
  String toString() {
    final imgDecoded = decode();
    final output = StringBuffer();

    output.writeln();

    for (int i = 0; i < imgDecoded.length; i++) {
      final pixel = imgDecoded[i];

      if (i > 0 && i % width == 0) {
        output.writeln();
      }

      if (pixel == 1) {
        output.write("#");
      } else {
        output.write(" ");
      }
    }

    return output.toString();
  }

  void _load(String input) {
    final int imgSize = width * height;
    for (int i = 0; i < input.length; i += imgSize) {
      final pixels =
          input.substring(i, i + imgSize).split("").map(int.parse).toList();

      layers.add(SpaceImageLayer(i ~/ imgSize, pixels));
    }
  }
}

/// Single layer in [SpaceImage].
class SpaceImageLayer {
  final int index;
  final List<int> pixels;

  const SpaceImageLayer(this.index, this.pixels);

  int countDigits(int number) => pixels.where((i) => i == number).length;

  @override
  String toString() => "ImageLayer($index)";
}
