import 'package:handle/handle.dart';

void setSerializers() {
  JsonModelSerializer.common.addDeserializers({
    // JsonDeserializerOf<ExampleResponse>(ExampleResponse.fromJson),
  });
}
