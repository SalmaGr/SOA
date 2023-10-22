package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BanqueService {
	double conversion(double montant) {
		return montant;	
	}
	Compte getCompte(int code) {
		int solde = 0;
		Date dateCreation = new Date();
		Compte compte = new Compte(code, solde, dateCreation);
		return compte;
	}
	List<Compte> getComptes(){
		List<Compte> comptes = new ArrayList<Compte>();
		comptes.add(new Compte(1, 0, new Date()));
		comptes.add(new Compte(2, 0, new Date()));
		comptes.add(new Compte(3, 0, new Date()));
		return comptes;
		
	}
	public static void main(String[] args) {
		BanqueService bs =  new BanqueService();
		System.out.println(bs.conversion(10)+ "Euro");
	}

}
