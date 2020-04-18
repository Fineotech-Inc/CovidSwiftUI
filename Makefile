documentation: 
	@jazzy \
        --min-acl internal \
		--xcodebuild-arguments -project,Covid.xcodeproj,-scheme,Covid \
        --no-hide-documentation-coverage \
        --theme fullwidth \
        --output ./docs \
        --documentation=./*.md
	@rm -rf ./build
