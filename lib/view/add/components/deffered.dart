import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishankdev/modal/post_modal.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_asset_picker/form_builder_asset_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class _MobileView extends StatefulWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  State<_MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<_MobileView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Left Side of the card
          Expanded(
            flex: 1,
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'form-title',
                    initialValue: 'Title of the Article',
                    onChanged: (value) => setState(() {
                      _formKey.currentState!.save();
                    }),
                  ),
                  FormBuilderAssetPicker(
                    name: 'form-file',
                    allowMultiple: true,
                    withData: true,
                    type: FileType.custom,
                    allowedExtensions: const ['jpg', 'jpeg'],
                    // allowCompression: true,
                    validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required(context)],
                    ),
                    onFileLoading: (FilePickerStatus fileState) {
                      if (fileState == FilePickerStatus.picking) {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (context, origin, destination) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      }
                      if (fileState == FilePickerStatus.done) {
                        Navigator.pop(context);
                      }
                    },
                    onChanged: (listOfFiles) {
                      if (listOfFiles != null &&
                          _formKey.currentState!.saveAndValidate()) {
                        var snackBar = const SnackBar(
                            content: Text('Image Selected Successfully!'));
                        setState(() {});
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      }
                    },
                  ),
                  FormBuilderTextField(
                    name: 'form-desc',
                    initialValue: 'Project Description',
                    maxLines: 5,
                    onChanged: (value) => setState(() {
                      _formKey.currentState!.save();
                    }),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          var bytes = (_formKey.currentState!.value['form-file']
                                  as List)
                              .map((e) => (e as PlatformFile).bytes)
                              .toList();

                          var json = {
                            "name": _formKey.currentState!.value['title'],
                            "bytes": bytes,
                            "desc": _formKey.currentState!.value['form-desc'],
                          };

                          debugPrint(json['bytes'].toString());
                          saveToFirestore(json);
                        }
                      },
                      child: const Text('Submit')),
                  const Spacer(),
                ],
              ),
            ),
          ),
          // Right Side of the card
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: ColoredBox(
                color: Colors.white,
                child: Builder(builder: (context) {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.value.isNotEmpty) {
                    String formTitle =
                        _formKey.currentState?.value['form-title'] ??
                            'No Title';
                    String formDesc =
                        _formKey.currentState?.value['form-desc'] ??
                            'No Descripton';
                    List<PlatformFile> listOfFiles =
                        (_formKey.currentState!.value['form-file'] as List)
                            .map((e) => e as PlatformFile)
                            .toList();
                    return Column(
                      children: [
                        Center(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(formTitle),
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listOfFiles.length,
                              itemBuilder: (context, index) {
                                return Image.memory(
                                  listOfFiles[index].bytes!,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    return Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: AspectRatio(
                                          aspectRatio: 1, child: child),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(formDesc),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WebView extends StatefulWidget {
  const _WebView({Key? key}) : super(key: key);

  @override
  State<_WebView> createState() => _WebViewState();
}

class _WebViewState extends State<_WebView> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              // Left Side of the card
              Expanded(
                flex: 1,
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FormBuilderTextField(
                        name: 'form-title',
                        initialValue: 'Title of the Article',
                        onChanged: (value) => setState(() {
                          _formKey.currentState!.save();
                        }),
                      ),
                      FormBuilderAssetPicker(
                        name: 'form-file',
                        allowMultiple: true,
                        withData: true,
                        type: FileType.custom,
                        allowedExtensions: const ['jpg', 'jpeg'],
                        // allowCompression: true,
                        validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)],
                        ),
                        onFileLoading: (FilePickerStatus fileState) {
                          if (fileState == FilePickerStatus.picking) {
                            showGeneralDialog(
                              context: context,
                              pageBuilder: (context, origin, destination) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          }
                          if (fileState == FilePickerStatus.done) {
                            Navigator.pop(context);
                          }
                        },
                        onChanged: (listOfFiles) {
                          if (listOfFiles != null &&
                              _formKey.currentState!.saveAndValidate()) {
                            var snackBar = const SnackBar(
                                content: Text('Image Selected Successfully!'));
                            setState(() {});
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                        },
                      ),
                      FormBuilderTextField(
                        name: 'form-desc',
                        initialValue: 'Project Description',
                        onChanged: (value) => setState(() {
                          _formKey.currentState!.save();
                        }),
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Submit')),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              // Right Side of the card
              Expanded(
                flex: 1,
                child: ColoredBox(
                  color: Colors.white,
                  child: Builder(builder: (context) {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.value.isNotEmpty) {
                      String formTitle =
                          _formKey.currentState?.value['form-title'] ??
                              'No Title';
                      String formDesc =
                          _formKey.currentState?.value['form-desc'] ??
                              'No Descripton';
                      List<PlatformFile> listOfFiles =
                          (_formKey.currentState!.value['form-file'] as List)
                              .map((e) => e as PlatformFile)
                              .toList();
                      return Column(
                        children: [
                          Center(
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(formTitle),
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAlias,
                            child: SizedBox(
                              height: 250,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: listOfFiles.length,
                                itemBuilder: (context, index) {
                                  return Image.memory(
                                    listOfFiles[index].bytes!,
                                    height: 250,
                                    fit: BoxFit.cover,
                                    frameBuilder: (context, child, frame,
                                        wasSynchronouslyLoaded) {
                                      return Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: AspectRatio(
                                            aspectRatio: 1, child: child),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(formDesc),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column();
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppAuthScreen extends StatelessWidget {
  const AppAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        var _isMobileView = constraint.maxWidth <= 600;
        if (_isMobileView) {
          return const _MobileView();
        } else {
          return const _WebView();
        }
      },
    );

    // return SignInScreen(
    //   providerConfigs: const [
    //     GoogleProviderConfiguration(clientId: 'autoPickup'),
    //     PhoneProviderConfiguration()
    //   ],
    //   actions: [
    //     AuthStateChangeAction(
    //       (context, authState) {
    //         if (authState is SignedIn) {
    //           showGeneralDialog(
    //             context: context,
    //             pageBuilder: (context, origin, destination) {
    //               return LayoutBuilder(
    //                 builder: (context, constraint) {
    //                   var _isMobileView = constraint.maxWidth <= 600;
    //                   if (_isMobileView) {
    //                     return const _MobileView();
    //                   } else {
    //                     return const _WebView();
    //                   }
    //                 },
    //               );
    //             },
    //           );
    //         }
    //       },
    //     ),
    //   ],
    // );
  }
}

Future<void> saveToFirestore(Map<String, dynamic> json) async {
  final List<Uint8List> jpgImages =
      (json['bytes'] as List).map((e) => e as Uint8List).toList();
  var count = 0;
  for (var jpgImage in jpgImages) {
    count++;
    var fireStorageRef = FirebaseStorage.instance.ref('images/$count.jpeg');
    try {
      await fireStorageRef.putData(jpgImage);
    } catch (e) {
      debugPrint('error when syncing sata to firestorage');
    }
  }

  var imageObjectRef = FirebaseFirestore.instance
      .collection('post')
      .withConverter<PostObject>(
        fromFirestore: (snapshot, _) => PostObject.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  try {
    await imageObjectRef.add(PostObject.fromJson(json));
  } catch (e) {
    debugPrint("Some error while addind postObject :-" + e.toString());
  }
}
