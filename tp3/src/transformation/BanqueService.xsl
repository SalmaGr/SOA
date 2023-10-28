<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="totalSolde">
		<xsl:value-of
			select="sum(BanqueService/getComptes/solde)"></xsl:value-of>
	</xsl:variable>
	<xsl:variable name="totalSoldeFiltré">
		<xsl:value-of
						select="sum(BanqueService/getComptes[number(substring(Date, 1, 4)) > 2000]/solde)" />
	</xsl:variable>
	<xsl:template match="/">
		<html>
			<head>
				<title>Liste des comptes</title>
				<style>
					table {
					margin: 0 auto; /* Centrez le tableau */
					}
					th, td, h1, p {
					text-align: center; /* Centrez les titres, le texte des cellules d'en-tête et
					des cellules de données */
					}
				</style>
			</head>
			<body>
				<h1>Liste des comptes</h1>
				<table border="1">
					<tr>
						<th style="color: #0F056B;">Code</th>
						<th style="color: #0F056B;">Solde</th>
						<th style="color: #0F056B;">Date de création</th>
					</tr>
					<xsl:for-each select="BanqueService/getComptes">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="Date" />
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<!-- Afficher la somme totale des soldes de tous les comptes -->
				<p>
					Somme totale des soldes de tous les comptes :
					<xsl:value-of select="$totalSolde"></xsl:value-of>
				</p>

				<h1>Liste des comptes créés après l'année 2000</h1>
				<table border="1">
					<tr>
						<th style="color: #0F056B;">Code</th>
						<th style="color: #0F056B;">Solde</th>
						<th style="color: #0F056B;">Date de création</th>
					</tr>
					<xsl:for-each
						select="BanqueService/getComptes[number(substring(Date, 1, 4)) > 2000]">
						<tr>
							<td>
								<xsl:value-of select="code" />
							</td>
							<td>
								<xsl:value-of select="solde" />
							</td>
							<td>
								<xsl:value-of select="Date" />
							</td>
						</tr>
					</xsl:for-each>
				</table>

				<!-- Afficher la somme totale des soldes des comptes filtrés -->
				<p>
					Somme totale des soldes des comptes filtrés :
					<xsl:value-of select="$totalSoldeFiltré"></xsl:value-of>
				</p>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
