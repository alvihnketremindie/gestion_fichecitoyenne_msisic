<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
  <!--  connexion à la base de données  prets -->
<sql:connection id="conn1">
	<sql:url>jdbc:mysql://localhost:3306/demandecitoyen?user=root&useEncoding=true&characterEncoding=UTF-8</sql:url>
	<sql:driver>com.mysql.jdbc.Driver</sql:driver>
</sql:connection>
