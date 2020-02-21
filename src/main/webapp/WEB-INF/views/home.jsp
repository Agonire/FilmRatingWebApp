<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<body>
    <h2>Home page</h2>

    <security:authorize access="hasRole('ADMIN')">
        <hr>
            <p>
                <a href="${pageContext.request.contextPath}/admin/panel">Admin panel</a>
            </p>
        </hr>
    </security:authorize>

    <a href="student/show">
        Student page
    </a>
    <p>
        Username: <security:authentication property="principal.username" />
    </p>
    <p>
        Role: <security:authentication property="principal.authorities" />
    </p>


    <form:form action="${pageContext.request.contextPath}/logout"
            method="POST">
        <input type="submit" value="Logout" />
    </form:form>
</body>
</html>