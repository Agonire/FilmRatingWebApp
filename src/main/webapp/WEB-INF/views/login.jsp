<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
    <c:if test="${param.error != null}">
        <i>Wrong credentials</i>
    </c:if>
    <c:if test="${param.logout != null}">
        <i>You have just logged out</i>
    </c:if>
    <form:form action="${pageContext.request.contextPath}/authenticate"
            method="POST">
        <p>
            Username: <input type="text" name="username" />
        </p>
        <p>
            Password: <input type="password" name="password" />
        </p>

        <input type="submit" value="Login" />
    </form:form>
</body>
</html>