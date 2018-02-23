<%@ page import="java.io.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String id1 = request.getParameter("id");

	//to get the content type information from JSP Request Header 
	String contentType = request.getContentType();
	// here we are checking the content type is not equal to Null and as well 
	// as the passed data from mulitpart/form-data is greater than or equal to 0

	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		if (formDataLength < 350000) {
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			//this loop converting the uploaded file into byte code
			while (totalBytesRead < formDataLength) {
				byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
				totalBytesRead += byteRead;
			}
			String file = new String(dataBytes);
			//for saving the file name
			String saveFile = new String(dataBytes, "UTF-8");
			saveFile = file.substring(file.indexOf("filename=\"") + 10);
			saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
			String saveFichier = util.HTMLFilter.removeAccents(saveFile).replaceAll(" ", "");

			// modifiez l'adresse de ce répertoire en fonction de votre environnement

			//String savefileDir = "D:\\JSP 2018\\travail 2018\\corrigeCitoyen\\WebContent\\images\\" + saveFichier;
			String savefileDir = "C:\\Users\\Alvihn\\eclipse-workspace\\gestionCitoyen\\WebContent\\images\\"+ saveFichier;
			//String savefileDir = "../images\\" + saveFichier;
			//  ****

			System.out.println("savefileDir = " + savefileDir);
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1, contentType.length());
			int pos;
			//extracting the index of file 
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) - 4;
			int startPos = ((file.substring(0, pos)).getBytes()).length;
			int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			// creating a new file with the same name and writing the content in new file
			FileOutputStream fileOut = new FileOutputStream(savefileDir);
			fileOut.write(dataBytes, startPos, (endPos - startPos));
			fileOut.flush();
			fileOut.close();

			response.sendRedirect("gestionBaseDocument.jsp" + "?docmise=" + saveFichier);
		} else {
			response.sendRedirect("uploadPage.jsp?tropgrand=true");

		}
	}
%>