# This will need moving elsewhere and parameterised
build_dir=`xcodebuild -workspace ../ios-app/thenetbook/thenetbook.xcworkspace -scheme thenetbook -configuration Debug -sdk iphonesimulator -showBuildSettings | grep -m 1 "CONFIGURATION_BUILD_DIR" | grep -oEi "\/.*" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`

# Load the correct configuration; use some default values if needed
ENV['DN'] ||= "iPhone 6 Plus"
ENV['PV'] ||= "10.0"
ENV['APP'] ||= "#{build_dir.strip}/thenetbook.app"
ENV['TYPE'] ||= "iphone"
ENV['UDID'] ||= nil

# ENV['DN'] ||= "iPad 2"
# ENV['PV'] ||= "8.4"
# ENV['APP'] ||= "#{build_dir.strip}/thenetbook.app"
# ENV['TYPE'] ||= "iPad 2"
# ENV['UDID'] ||= nil