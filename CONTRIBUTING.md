# 🤝 Contributing to Lynx

Thank you for your interest in contributing to Lynx! This document provides guidelines and information for contributors.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Testing Guidelines](#testing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Reporting Bugs](#reporting-bugs)
- [Feature Requests](#feature-requests)

## 📜 Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

### Our Standards

- **Be respectful** and inclusive of all contributors
- **Be collaborative** and open to different viewpoints
- **Be constructive** in feedback and discussions
- **Be professional** in all interactions

## 🚀 How Can I Contribute?

### Reporting Bugs

- **Check existing issues** before creating a new one
- **Use the bug report template** when creating issues
- **Provide detailed information** including:
  - iOS version and device
  - Steps to reproduce
  - Expected vs actual behavior
  - Screenshots or screen recordings

### Suggesting Enhancements

- **Describe the feature** clearly and concisely
- **Explain the use case** and benefits
- **Consider implementation** complexity
- **Check if it aligns** with project goals

### Code Contributions

- **Pick an issue** from the "Good First Issue" or "Help Wanted" labels
- **Comment on the issue** to let others know you're working on it
- **Follow the coding standards** outlined below
- **Write tests** for new functionality
- **Update documentation** as needed

## 🛠️ Development Setup

### Prerequisites

- **Xcode 15.0+** (Latest stable version)
- **iOS 18.5+** deployment target
- **Firebase Account** for backend services
- **Git** for version control

### Local Development

1. **Fork the repository**
   ```bash
   git clone https://github.com/yourusername/lynx.git
   cd lynx
   ```

2. **Set up Firebase**
   - Create a development Firebase project
   - Download `GoogleService-Info.plist`
   - Replace the placeholder file

3. **Install dependencies**
   - Open `Lynx.xcodeproj` in Xcode
   - Build the project to resolve Swift Package Manager dependencies

4. **Run the app**
   - Select your target device/simulator
   - Press `Cmd + R` to build and run

### Development Environment

- **SwiftLint**: Code style enforcement
- **SwiftFormat**: Code formatting
- **Firebase CLI**: Backend development tools

## 📝 Coding Standards

### Swift Style Guide

- **Follow Apple's Swift API Design Guidelines**
- **Use SwiftLint** for consistent code style
- **Prefer SwiftUI** over UIKit for new views
- **Use modern Swift features** (async/await, @MainActor)

### Naming Conventions

- **PascalCase** for types and protocols
- **camelCase** for variables and functions
- **Descriptive names** that explain purpose
- **Avoid abbreviations** unless widely understood

### Code Organization

- **Group related functionality** in extensions
- **Use MARK comments** for logical sections
- **Keep functions focused** and single-purpose
- **Limit file size** to reasonable limits

### Documentation

- **Document public APIs** with Swift documentation comments
- **Include examples** for complex functionality
- **Update README** for new features
- **Add inline comments** for complex logic

## 🧪 Testing Guidelines

### Unit Tests

- **Test business logic** in managers and models
- **Mock dependencies** for isolated testing
- **Test edge cases** and error conditions
- **Maintain high test coverage**

### UI Tests

- **Test critical user flows** and navigation
- **Verify UI state** changes correctly
- **Test accessibility** features
- **Use realistic test data**

### Integration Tests

- **Test Firebase operations** with test database
- **Verify data persistence** and retrieval
- **Test authentication flows** end-to-end
- **Clean up test data** after tests

### Test Structure

```swift
class CouponManagerTests: XCTestCase {
    var sut: CouponManager!
    var mockFirestore: MockFirestore!
    
    override func setUp() {
        super.setUp()
        mockFirestore = MockFirestore()
        sut = CouponManager(firestore: mockFirestore)
    }
    
    override func tearDown() {
        sut = nil
        mockFirestore = nil
        super.tearDown()
    }
    
    func testFetchCoupons_Success() {
        // Given
        let expectedCoupons = [Coupon.mock]
        mockFirestore.mockResult = .success(expectedCoupons)
        
        // When
        let result = await sut.fetchCoupons()
        
        // Then
        XCTAssertEqual(result, expectedCoupons)
    }
}
```

## 🔄 Pull Request Process

### Before Submitting

1. **Ensure tests pass** locally
2. **Update documentation** as needed
3. **Check code style** with SwiftLint
4. **Test on different devices** if UI changes

### PR Description

- **Clear title** describing the change
- **Detailed description** of what was changed
- **Link related issues** using GitHub keywords
- **Include screenshots** for UI changes
- **List testing steps** for reviewers

### Review Process

- **Address review comments** promptly
- **Request reviews** from appropriate team members
- **Respond to feedback** constructively
- **Update PR** based on review suggestions

### Merge Requirements

- **All tests pass** in CI/CD pipeline
- **Code review approved** by maintainers
- **No merge conflicts** with main branch
- **Documentation updated** if needed

## 🐛 Reporting Bugs

### Bug Report Template

```markdown
## Bug Description
Brief description of the issue

## Steps to Reproduce
1. Step 1
2. Step 2
3. Step 3

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- iOS Version: [e.g., 18.5]
- Device: [e.g., iPhone 15 Pro]
- App Version: [e.g., 1.0.0]

## Additional Information
Screenshots, logs, or other relevant details
```

## 💡 Feature Requests

### Feature Request Template

```markdown
## Feature Description
Clear description of the requested feature

## Use Case
Why this feature is needed and how it would be used

## Proposed Implementation
Optional: Suggestions for how to implement

## Alternatives Considered
Other approaches that were considered

## Additional Context
Any other relevant information
```

## 📚 Resources

### Documentation
- [SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/)
- [Firebase iOS Guide](https://firebase.google.com/docs/ios/setup)
- [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)

### Tools
- [SwiftLint](https://github.com/realm/SwiftLint)
- [SwiftFormat](https://github.com/nicklockwood/SwiftFormat)
- [Firebase CLI](https://firebase.google.com/docs/cli)

### Community
- [Swift Forums](https://forums.swift.org/)
- [Firebase Community](https://firebase.google.com/community)
- [iOS Dev Weekly](https://iosdevweekly.com/)

## 🎯 Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Discord/Slack**: For real-time chat (if available)
- **Email**: For sensitive or private matters

## 🙏 Recognition

Contributors will be recognized in:
- **README.md** contributors section
- **GitHub contributors** page
- **Release notes** for significant contributions
- **Project documentation** where appropriate

---

Thank you for contributing to Lynx! Your contributions help make this project better for everyone. 🚀
