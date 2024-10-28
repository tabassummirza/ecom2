<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>OTP Verification</title>
</head>
<body>
    <h2>OTP Verification</h2>

    <form action="verify-otp" method="post">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <button type="submit">Verify OTP</button>
    </form>
</body>
</html>