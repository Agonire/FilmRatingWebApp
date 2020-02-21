<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<body>
    <h2>You have not enough rights to see this page</h2>

    <hr>
        <p>
            <a href="${pageContext.request.contextPath}/">Home page</a>
        </p>
    </hr>

    <form:form action="${pageContext.request.contextPath}/logout"
            method="POST">
        <input type="submit" value="Logout" />
    </form:form>
</body>
</html>