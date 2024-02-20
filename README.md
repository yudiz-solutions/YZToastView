
# YZToastView

<br>

<div align="left">
  <img src="/YZToastView/Resource/ToastView.gif" alt="Sample YZToastView" style="margin-bottom: 20px;">
</div>

<br>


**YZToastView** is a lightweight and easy-to-use Swift class for displaying toast messages in your iOS application. It provides a simple way to show brief messages or notifications to the user in a non-intrusive manner.

## Features

- Display toast messages with a customizable background color, text color, and message.
- Easily integrate into your iOS project to provide non-intrusive notifications.

## Usage

- To display a toast message, simply call the 

```
 YZToastView.shared.show(withMessage: "This is a toast message",inView: view,bgColor: .red, textColor: .white)
```

## Parameters

- withMessage: The message to display in the toast.
- inView: The view to display the toast in.
- bgColor: The background color of the toast. default is green
- textColor: The text color of the toast. default is white
