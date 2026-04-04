const List<String> supportedLanguages = ['en', 'cs', 'de', 'fr', 'it', 'es'];

const Map<String, String> languageNames = {
  'en': 'English',
  'cs': 'Čeština',
  'de': 'Deutsch',
  'fr': 'Français',
  'it': 'Italiano',
  'es': 'Español',
};

const Map<String, Map<String, String>> uiStrings = {
  'continue': {
    'en': 'Continue',
    'cs': 'Pokračovat',
    'de': 'Fortsetzen',
    'fr': 'Continuer',
    'it': 'Continua',
    'es': 'Continuar',
  },
  'newGame': {
    'en': 'New Game',
    'cs': 'Nová hra',
    'de': 'Neues Spiel',
    'fr': 'Nouvelle partie',
    'it': 'Nuova partita',
    'es': 'Nueva partida',
  },
  'settings': {
    'en': 'Settings',
    'cs': 'Nastavení',
    'de': 'Einstellungen',
    'fr': 'Paramètres',
    'it': 'Impostazioni',
    'es': 'Ajustes',
  },
  'exitGame': {
    'en': 'Exit Game',
    'cs': 'Ukončit hru',
    'de': 'Spiel beenden',
    'fr': 'Quitter le jeu',
    'it': 'Esci dal gioco',
    'es': 'Salir del juego',
  },
  'back': {
    'en': 'Back',
    'cs': 'Zpět',
    'de': 'Zurück',
    'fr': 'Retour',
    'it': 'Indietro',
    'es': 'Atrás',
  },
  'artFocus': {
    'en': 'Art Focus',
    'cs': 'Obraz',
    'de': 'Kunstmodus',
    'fr': 'Mode art',
    'it': 'Modalità arte',
    'es': 'Modo arte',
  },
  'storyFocus': {
    'en': 'Story Focus',
    'cs': 'Příběh',
    'de': 'Geschichtenmodus',
    'fr': 'Mode histoire',
    'it': 'Modalità storia',
    'es': 'Modo historia',
  },
  'endOfStory': {
    'en': 'You have reached the end of the story.\n\nThank you for playing!\n\nYou can start the story again and choose different paths.',
    'cs': 'Dosáhli jste konce příběhu.\n\nDěkujeme za hraní!\n\nMůžete příběh začít znovu a zvolit si jiné cesty.',
    'de': 'Sie haben das Ende der Geschichte erreicht.\n\nVielen Dank fürs Spielen!\n\nSie können die Geschichte erneut beginnen und andere Wege wählen.',
    'fr': 'Vous avez atteint la fin de l\'histoire.\n\nMerci d\'avoir joué !\n\nVous pouvez recommencer l\'histoire et choisir des chemins différents.',
    'it': 'Hai raggiunto la fine della storia.\n\nGrazie per aver giocato!\n\nPuoi ricominciare la storia e scegliere percorsi diversi.',
    'es': 'Has llegado al final de la historia.\n\n¡Gracias por jugar!\n\nPuedes empezar la historia de nuevo y elegir caminos diferentes.',
  },
  'returnToMenu': {
    'en': 'Return to Main Menu',
    'cs': 'Zpět do hlavního menu',
    'de': 'Zurück zum Hauptmenü',
    'fr': 'Retour au menu principal',
    'it': 'Torna al menu principale',
    'es': 'Volver al menú principal',
  },
};

String ui(String key, String lang) => uiStrings[key]?[lang] ?? uiStrings[key]?['en'] ?? key;

String nextLanguage(String current) {
  final index = supportedLanguages.indexOf(current);
  return supportedLanguages[(index + 1) % supportedLanguages.length];
}
