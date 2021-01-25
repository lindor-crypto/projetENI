<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="fr.eni.encheresprojetjls.messages.LecteurMessage"%>


<!doctype html>
<html lang="fr">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<title>Vendre un article</title>
<!-- Bootstrap core CSS -->
<link href="../../../vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../../css/4-col-portfolio.css" rel="stylesheet">

<!-- Google code prettify -->
<link rel="stylesheet" type="text/css"
	href="../../../vendor/google-code-prettify/prettify.css">
</head>

<body>
	<br>
	<c:if test="${!empty sessionScope.pseudo && !empty sessionScope.nom}">
		<header>
			<div>
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					<div class="container">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/ServletPageEncheres1">ENI-Encheres_Projet_JLS</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarResponsive"
							aria-controls="navbarResponsive" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarResponsive">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item active">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletPageEncheres1">Enchères
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/article/creation">Vendre
										un article </a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletProfil">Mon
										Profil </a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletDeconnection">Déconnexion
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletProfil">${ sessionScope.nom }
										connecté(e)</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</header>

		<br>
		<br>
		<div class="container">
			<br> <br>
			<c:if test="${!empty listeCodesErreur}">
				<div class="alert alert-danger" role="alert">
					<strong>Erreur!</strong>
					<ul>
						<c:forEach var="code" items="${listeCodesErreur}">
							<li>${LecteurMessage.getMessageErreur(code)}</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>


			<c:if test="${!empty sessionScope.pseudo && !empty sessionScope.nom}">
				<form method="POST"
					action="${pageContext.request.contextPath}/article/creation" enctype="multipart/form-data">
					<div class="form-row">
						<div class="col-lg-5 md-6 mb-3 ">
							<label for="image_Article">photo :</label> <input type="image"
								id="photoArticle" src="">

						</div>
						<div class="col-lg-5  offset-lg-1 md-6 mb-6">
							<label for="Article">Article :</label> <input type="text"
								class="form-control " id="Article" name="Article" required>

						</div>
					</div>
					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Description">Description :</label>
							<textarea rows="5" cols="33" class="form-control "
								id="Descritpion" name="Description" required>
    				  </textarea>
						</div>

					</div>
					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Categorie">Categorie :</label> <select
								class="custom-select" name="categories" id="inputGroupSelect01">
								<option selected value="1">Toutes...</option>
								<option value="1">Objets</option>
								<option value="2">Electronique</option>
								<option value="3">Electromenager</option>
								<option value="4">Ameublement</option>
								<option value="5">Vetement</option>
								<option value="6">Sport & Loisir</option>
								<option value="7">Jeux & jouets</option>
							</select>
						</div>
					</div>

					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Image">Uploader une image :</label> <input
								class="form-control" type="file" id="file" name="file" value="select images.." 
								accept="image/png, image/jpeg, image/jpg">
						</div>
					</div>

					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Mise_a_Prix">Mise a prix :</label> <input
								type="number" class="form-control " id="Mise_a_Prix" value=""
								name="Mise_a_Prix">
						</div>
					</div>
					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Date_Debut_Enchere">Début de l'enchère :</label> <input
								type="date" class="form-control " min="2020-11-07T00:00"
								max="2050-12-31T00:00" id="Date_Debut_Enchere"
								name="Date_Debut_Enchere">
						</div>
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="heure_Debut_Enchere">heure de debut :</label> <input
								type="time" class="form-control " id="heure_Debut_Enchere"
								name="heure_Debut_Enchere">
						</div>
					</div>
					<div class="form-row">
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="Date_Fin_Enchere">Fin de l'enchère :</label> <input
								type="date" class="form-control " min="2020-11-07"
								max="2050-12-31" id="Date_Fin_Enchere" name="Date_Fin_Enchere">
						</div>
						<div class="col-lg-5 md-6 offset-lg-6">
							<label for="heure_fin_Enchere">heure de fin :</label> <input
								type="time" class="form-control " id="Date_Debut_Enchere"
								name="heure_fin_Enchere">
						</div>
					</div>

					<div class="col-md-6 mb-3">

						<input type="hidden" class="form-control " id="noUtilisateur"
							name="noUtilisateur" value="${sessionScope.noUtilisateur}">

					</div>
					<br> <br> <br>
					<div class="border border-info">
						<div class=" col-lg-5 md-6 offset-lg-6">
							<h4 class="my-4 text-center">
								<span>point de retrait</span>
							</h4>
							<div class="form-row">
								<div>
									<label for="Rue">Rue :</label> <input type="text"
										class="form-control " id="Rue" value="${sessionScope.rue}"
										name="Rue">

								</div>
							</div>
							<div class="form-row">
								<div>
									<label for="Code_Postal">Code postal :</label> <input
										type="text" class="form-control "
										value="${sessionScope.codePostal}" id="Code_Postal"
										name="Code_Postal">

								</div>
							</div>

							<div class="form-row">

								<div>
									<label for="Ville">Ville :</label> <input type="text"
										class="form-control " value="${sessionScope.ville}" id="Ville"
										name="Ville">
								</div>
							</div>
						</div>

					</div>
					<br> <br>
					<div class="form-row">
						<div class=" col-lg-5 md-12 offset-lg-6">
							<button class="btn btn-primary" type="submit">Créer</button>

						</div>
					</div>
				</form>
				<a href="${pageContext.request.contextPath}/ServletPageEncheres1"><button
						class="btn btn-primary" type="reset">Annuler</button></a>
			</c:if>
		</div>


	</c:if>
	<c:if test="${empty sessionScope.pseudo && empty sessionScope.nom}">
		<header>
			<div>
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
					<div class="container">
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/ServletPageEncheres1">ENI-Encheres_Projet_JLS</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarResponsive"
							aria-controls="navbarResponsive" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarResponsive">
							<ul class="navbar-nav ml-auto">
								<li class="nav-item active">
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletInscription"><button
											type="button" class="btn btn-primary btn-lg btn-block">S'inscrire
										</button></a></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/ServletConnection"><button
											type="button" class="btn btn-primary btn-lg btn-block">Se
											connecter</button></a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<br>
<br>
	<br>
	<br>
	<p class="text-center">Session expirée</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	</c:if>

	<br>
	<br>
	>
	
	<br>
	<br>
	<footer class="py-5 bg-dark footer-demodule">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; ENI Ecole
				2018</p>
		</div>

		<!-- /.container -->
	</footer>
	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    -->
</body>
</html>