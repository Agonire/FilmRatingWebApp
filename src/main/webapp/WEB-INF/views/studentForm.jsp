<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head xmlns:form="http://www.w3.org/1999/html">
    <title>Student registration</title>
</head>
<body>

    <form:form action="process" modelAttribute="student">

        First name: <form:input path="firstName" />
        <form:errors path="firstName" /><br>

        Last name: <form:input path="lastName" /><br>
        <form:errors path="lastName" /><br>

        <input type="submit">
    </form:form>

</body>
</html>