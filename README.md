# Text Recognition App with Tesseract OCR

A powerful mobile application built using Flutter and Tesseract OCR for efficient and accurate text extraction from images. This app leverages the Tesseract OCR engine, one of the most accurate open-source OCR engines available, to convert images to text seamlessly.

## Features

- **Image to Text Conversion**: Quickly convert images to text with high accuracy.
- **Support for Custom Trained Data**: Utilizes custom Tesseract trained data for improved recognition.
- **Export to PDF**: Capability to export the recognized text to PDF format.
- **Easy Image Selection**: Pick images directly from your gallery or capture new ones with your camera.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have Flutter installed on your system. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone the repository:
```bash
git clone https://github.com/felixgonzales01/TextRecognitionApp-Flutter_TesseractOCR.git
```

2. Navigate to the project directory:
```bash
cd TextRecognitionApp-Flutter_TesseractOCR
```

3. Install the dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## How to Use

1. Launch the app on your device.
2. Tap on the 'Browse' button to select an image from your gallery or capture a new one using your camera.
3. Wait for the app to process the image and display the extracted text.
4. (Optional) Export the extracted text to a PDF file.

## Customization

To customize or improve the text recognition accuracy, you can train your own Tesseract OCR data and replace the `carljasonmaneja.traineddata` file in the `assets/tessdata` directory.

## Built With

- [Flutter](https://flutter.dev/) - The UI toolkit used for building natively compiled applications.
- [Tesseract OCR](https://github.com/tesseract-ocr/tesseract) - An OCR engine for various operating systems.
- [Flutter Tesseract OCR](https://pub.dev/packages/flutter_tesseract_ocr) - A Flutter plugin for Tesseract OCR.
