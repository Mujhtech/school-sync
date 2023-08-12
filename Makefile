xcode:
	open ios/Runner.xcworkspace

install:
	flutter pub get

ci:
	make format && make analyze && make test_coverage

format:
	dart format --set-exit-if-changed -l 120 lib

analyze:
	flutter analyze lib

test_coverage:
	flutter test --no-pub --coverage --test-randomize-ordering-seed random

clean_coverage:
	lcov --remove coverage/lcov.info 'lib/**/*.g.dart' 'lib/**/*_mock_impl.dart' 'lib/presentation/theme/*' 'lib/presentation/constants/*' -o coverage/lcov.info

build_coverage:
	make test_coverage && make clean_coverage && genhtml -o coverage coverage/lcov.info

open_coverage:
	make build_coverage && open coverage/index.html

build_runner_build:
	flutter packages pub run build_runner build -d --enable-experiment=records,patterns,sealed-class

build_runner_watch:
	flutter packages pub run build_runner watch -d --enable-experiment=records,patterns,sealed-class

# iOS
prod_ios:
	flutter build ios

# Android

prod_android:
	flutter build apk

prod_android_bundle:
	flutter build appbundle
