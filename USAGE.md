# FFmpeg Kit Flutter 使用指南

## 通过 Git 依赖使用

在你的 Flutter 项目 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  ffmpeg_kit_flutter_new_min:
    git:
      url: https://github.com/SeedV/ffmpeg_kit_flutter.git
      ref: <tag-or-commit>  # 建议使用 tag 锁定版本
```

### 示例

```yaml
dependencies:
  ffmpeg_kit_flutter_new_min:
    git:
      url: https://github.com/SeedV/ffmpeg_kit_flutter.git
      ref: v3.2.0  # 使用 tag
```

## 首次使用（重要）

由于 Frameworks 不包含在仓库中，首次使用需要下载：

### 方式一：自动下载（推荐）

iOS 和 macOS 的 Frameworks 会在 `pod install` 时自动下载（通过 podspec 的 `prepare_command`）。

### 方式二：手动下载

如果自动下载失败，可以手动运行：

```bash
# iOS
./scripts/setup_ios.sh

# macOS
./scripts/setup_macos.sh
```

### 方式三：手动下载到项目

如果通过 Git 依赖使用，也可以在宿主项目中手动下载：

```bash
cd your_project/ios
# 下载并解压 Frameworks 到 .symlinks/plugins/ffmpeg_kit_flutter_new_min/ios/Frameworks/
```

## 支持平台

| 平台 | 架构 |
|------|------|
| iOS | arm64 (真机), arm64/x86_64 (模拟器) |
| macOS | x86_64, arm64 (Apple Silicon) |
| Android | arm64-v8a, armeabi-v7a, x86, x86_64 |

## 使用方法

```dart
import 'package:ffmpeg_kit_flutter_new_min/ffmpeg_kit.dart';

// 执行 FFmpeg 命令
await FFmpegKit.execute('-i input.mp4 -c:v libx264 output.mp4');

// 执行 FFprobe 命令
final session = await FFprobeKit.execute('-v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 input.mp4');
final duration = await session.getOutput();
```

## 本地开发

如果需要本地开发调试，使用 path 依赖：

```yaml
dependencies:
  ffmpeg_kit_flutter_new_min:
    path: /path/to/ffmpeg_kit_flutter
```

本地开发时，首次需要运行：

```bash
./scripts/setup_ios.sh
./scripts/setup_macos.sh
```

## 注意事项

- iOS 最低部署版本：14.0
- macOS 最低部署版本：10.15
- 此版本为 `min` 变体，包含基本的 FFmpeg 功能