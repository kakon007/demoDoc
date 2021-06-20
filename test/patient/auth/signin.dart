
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/validator.dart';
import 'package:test/test.dart';

main() {
  test("when__try_valid_email__should__pass", () {
    Validator validator = Validator();

    var actual = validator.validateEmail("myhealthbd@myhealthbd.com");
    expect(actual, null);
  });

  test("when__try_invalid_email__should__return_${StringResources.pleaseEnterAValidEmailText}", () {
    Validator validator = Validator();
    var actual = validator.validateEmail("myhealth.com");
    expect(actual, StringResources.pleaseEnterAValidEmailText);
  });

  test("when_email_is_empty__should__return_${StringResources.pleaseEnterEmailText}", () {
    Validator validator = Validator();
    var actual = validator.validateEmail("");
    expect(actual, StringResources.pleaseEnterEmailText);
  });

  test("when__try_invalid_email__should__return_${StringResources.pleaseEnterAValidEmailText}", () {
    Validator validator = Validator();

    var actual = validator.validateEmail("myhealthbd@");
    expect(actual, StringResources.pleaseEnterAValidEmailText);
  });

  test(
      "when__try_invalid_email_with_white_space__should__return_${StringResources.pleaseEnterAValidEmailText}",
      () {
    Validator validator = Validator();
    var actual = validator.validateEmail("myhealthbd @myhealthbd.com");
    expect(actual, StringResources.pleaseEnterAValidEmailText);
  });
  test("when__the_pass_field_is_empty__should__show_this_field_required_warning_&_test_should_pass",
          () {
        var actual = Validator().validatePassword("");
        var expected = StringResources.thisFieldIsRequired;
        expect(actual, expected);
      });
}
