import java.util.*;

public class Pendu {
    // --- Partie JeuPendu ---
    private String motADeviner;
    private Set<Character> lettresTrouvees;
    private Set<Character> lettresProposees;
    private int essaisRestants;
    private static final int ESSAIS_MAX = 6;
    private static final String[] LISTE_MOTS = {
        "ordinateur", "programmation", "developpement", "java", "interface",
        "serveur", "algorithme", "reseau", "variable", "compilation"
    };

    public Pendu() {
        Random rand = new Random();
        this.motADeviner = LISTE_MOTS[rand.nextInt(LISTE_MOTS.length)].toUpperCase();
        this.lettresTrouvees = new HashSet<>();
        this.lettresProposees = new HashSet<>();
        this.essaisRestants = ESSAIS_MAX;
    }

    public boolean proposerLettre(char lettre) {
        lettre = Character.toUpperCase(lettre);
        if (lettresProposees.contains(lettre)) {
            System.out.println("Vous avez déjà proposé cette lettre !");
            return false;
        }

        lettresProposees.add(lettre);

        if (motADeviner.indexOf(lettre) >= 0) {
            lettresTrouvees.add(lettre);
            return true;
        } else {
            essaisRestants--;
            return false;
        }
    }

    public boolean estGagne() {
        for (char c : motADeviner.toCharArray()) {
            if (!lettresTrouvees.contains(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean estPerdu() {
        return essaisRestants <= 0;
    }

    public void afficherMot() {
        for (char c : motADeviner.toCharArray()) {
            if (lettresTrouvees.contains(c)) {
                System.out.print(c + " ");
            } else {
                System.out.print("_ ");
            }
        }
        System.out.println();
    }

    public void afficherEtat() {
        afficherMot();
        System.out.println("Lettres proposées : " + lettresProposees);
        System.out.println("Essais restants : " + essaisRestants);
        afficherPendu();
    }

    private void afficherPendu() {
        int etat = ESSAIS_MAX - essaisRestants;
        switch (etat) {
            case 1:
                System.out.println("  O");
                break;
            case 2:
                System.out.println("  O\n  |");
                break;
            case 3:
                System.out.println("  O\n /|");
                break;
            case 4:
                System.out.println("  O\n /|\\");
                break;
            case 5:
                System.out.println("  O\n /|\\\n /");
                break;
            case 6:
                System.out.println("  O\n /|\\\n / \\");
                break;
            default:
                System.out.println();
        }
    }

    public String getMotADeviner() {
        return motADeviner;
    }

    // --- Partie Main ---
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean rejouer = true;

        System.out.println("Bienvenue dans le jeu du Pendu !");

        while (rejouer) {
            Pendu jeu = new Pendu();

            while (!jeu.estGagne() && !jeu.estPerdu()) {
                jeu.afficherEtat();
                System.out.print("Proposez une lettre : ");
                String entree = scanner.nextLine();

                if (entree.length() != 1 || !Character.isLetter(entree.charAt(0))) {
                    System.out.println("Veuillez entrer UNE seule lettre !");
                    continue;
                }

                jeu.proposerLettre(entree.charAt(0));
            }

            if (jeu.estGagne()) {
                System.out.println("Félicitations ! Vous avez deviné le mot : " + jeu.getMotADeviner());
            } else {
                System.out.println("Dommage ! Le mot était : " + jeu.getMotADeviner());
            }

            System.out.print("Voulez-vous rejouer ? (o/n) : ");
            String reponse = scanner.nextLine();
            if (!reponse.equalsIgnoreCase("o")) {
                rejouer = false;
            }
        }

        System.out.println("Merci d'avoir joué !");
        scanner.close();
    }
}

