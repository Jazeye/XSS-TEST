# XSS Testing Lab README

## Overview

The XSS Testing Lab consists of multiple HTML pages designed to demonstrate and test different types of Cross-Site Scripting (XSS) vulnerabilities, including:

- Reflective XSS
- Stored XSS
- DOM-based XSS

This README provides a brief description of each test page and includes example testing scripts for simulating attacks.

## Pages Description

### 1. Home Page (`index.html`)

The main entry point of the lab where users can navigate to different types of XSS tests.

### 2. Reflective XSS Test (`reflective.html`)

This page reflects user input directly in the HTML, showcasing how a malicious user could inject a script.

### Testing Script Commands

To test for reflective XSS, use the following command in your browser's address bar:

```
http://yourdomain/reflective.html?input=<script>alert('Reflective XSS');</script>
```

### 3. Stored XSS Test (`stored.html`)

This page allows users to submit messages, which are then stored in localStorage. If the stored message contains a script, it will execute when the message is displayed.

### Testing Script Commands

To test for stored XSS, execute the following command:

1. Submit a message using the form:

```html
<script>alert('Stored XSS');</script>
```

1. After submission, refresh the page to see the alert.

### 4. DOM-based XSS Test (`dom.html`)

This page allows users to search for shoe products and demonstrates DOM-based XSS by evaluating user input in the search query.

### Testing Script Commands

To test for DOM-based XSS, use the following command in your browser's address bar:

```
http://yourdomain/dom.html?query=alert('DOM-based XSS');
```

## General Testing Steps

1. Open your web browser.
2. Navigate to the XSS Testing Lab homepage (`index.html`).
3. Click on any of the test links to access specific XSS tests.
4. Use the provided testing script commands to perform XSS injections.
5. Observe the behavior and alerts triggered by the scripts.

## Important Note

This testing lab is intended for educational purposes only. Never use XSS attacks on live websites or applications without permission, as this is illegal and unethical.

## Conclusion

The XSS Testing Lab provides a practical environment to understand and demonstrate XSS vulnerabilities. Ensure you handle this knowledge responsibly.