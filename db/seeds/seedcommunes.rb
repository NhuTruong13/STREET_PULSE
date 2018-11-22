puts "Deleting existing communes data..."

Commune.destroy_all

puts "Creating communes data..."

c0 = Commune.create!(
  name: "N/A",
  zip_code: "N/A",
  description: "N/A"
  )


c1 = Commune.create!(
  name: "Bruxelles-Ville",
  zip_code: "1000",
  description: "Bruxelles-Ville est le cœur de la région bruxelloise.  Elle vit au rythme des saisons : en été, l’Ommegang, le jazz (Brussels Jazz Marathon) et la plage (Bruxelles-Les-Bains) sont à l’honneur ; en automne, les journées du patrimoine, la nuit blanche et le marathon ; en hiver, les « Plaisirs d’Hiver » et les trésors de la Brafa (foire des antiquaires) ; au printemps enfin, la foire du livre et la nuit des musées.

  La Place Saint-Géry (Xème siècle), entourée autrefois par  la Senne (cours d’eau voûté au XIXème siècle) est le berceau de la cité .  Elle est aujourd’hui le centre d’un quartier branché à  proximité de la Rue Antoine Dansaert.  La ville s’étendra ensuite (enceinte des XIIème/début XIIIème siècle : il en reste la Tour Noire derrière l’Eglise Sainte-Catherine et la Tour Anneessens sur le Boulevard de l’Empereur) incluant la Grand-Place, la Cathédrale (alors Collégiale) Sainte-Gudule et le Palais des Ducs de Brabant (place Royale et partie du palais royal actuel), une des résidences principales de Charles Quint (XVIème siècle).  Vue la faiblesse de ses défenses et vu le manque de place, la cité s’agrandit en 1357 pour atteindre la dimension du pentagone actuel (une deuxième enceinte occupait alors la petite ceinture routière, il en reste un vestige : la Porte de Halle).  La ville va se prolonger encore au Sud-Est au XIXème siècle (Avenue Louise et Bois de la Cambre - Quartier Léopold/Quartier européen actuel – Squares -Cinquantenaire) et au Nord(-Est) au XXème siècle (Laeken, puis Haeren et Neder-Over-Heembeek).

  Sur le plan immobilier, les prix ont considérablement augmenté.  Bruxelles-ville reste dans la moyenne de l’agglomération pour l’achat d’une maison classique.  Par contre, le marché locatif est un des plus chers de la région.

  Point fort de la commune : depuis fin juin 2015, la ville dispose d’une  des plus grandes zones piétonnes d’Europe, partant de la Place De Brouckère chantée par Jacques Brel jusqu’au delà de la Bourse (dont le sculpteur Auguste Rodin a participé à la décoration).  Bien desservie en transports en commun (surtout (pré-)Métro).

  Culture en bref :  Autour du Parc de Bruxelles, de grands centres culturels (Théâtre du Parc, Bozar, Musée des Instruments de Musique, Musées Magritte, Fin de Siècle et Art Ancien…). Le Théâtre de la Monnaie est un haut lieu de la scène lyrique.  Au Cinquantenaire (au delà du Quartier européen), de nombreux musées : Armée, Autoworld, Art et Histoire…  Le folklore de la ville est aussi abondant : Théâtre de Toone, plantation du Meiboom (9 août)…

  Shopping : Le Boulevard de Waterloo (à ne pas confondre avec la Chaussée de Waterloo) et la Rue Antoine Dansaert présentent nombre d’enseignes haut de gamme.  La Rue Neuve est un axe commercial populaire important.

  Coups de cœur : Boire un verre ou prendre un lunch à l’orangerie du Parc d’Egmont , à deux pas du Boulevard de Waterloo (entrée au 44), offre un dépaysement en plein cœur de la capitale.  Manger des fruits de mer (avec de bonnes frites belges) dans un restaurant sur la Place Sainte-Catherine. N'oublions pas le délicieux chocolat belge!"
  )
c2 = Commune.create!(
  name: "Schaerbeek",
  zip_code: "1030",
  description: "Schaerbeek est une commune multiculturelle, constituée de quartiers bourgeois (Square Vergote, Place des Chasseurs Ardennais, Place de Jamblinne de Meux, Place Bremer…) et de coins populaires (Liedts, Helmet, Coteaux…),   Au centre, le Parc Josaphat, parsemé d’étangs, est le véritable poumon vert de la commune.  Il est situé au fond de la vallée de Josaphat, ancien cours d’eau (appelé aussi Roodenbeek), affluent du Maelbeek qui allait lui-même rejoindre la Senne.  Les ânes qui  vivent dans cet écrin de verdure et la cerise qu’on fête annuellement, symbolisent Schaerbeek et évoquent son passé agricole.

  Rattachée administrativement à Bruxelles (« cuve de Bruxelles ») en 1301, Schaerbeek restera longtemps un village.  Au XIXème siècle, la destruction des remparts (1818), la création de la ligne de chemin de fer Bruxelles-Malines (1835) et la suppression de l’octroi (taxe à l’entrée de Bruxelles-ville) (1860) vont pousser la commune à s’urbaniser : Rue Royale, Chaussée de Haecht, Avenue Rogier...  Au XXème siècle, les nouvelles Avenues Louis Bertrand, Voltaire et Paul Deschanel accueilleront la bourgeoisie.  Les architectes Victor Besme (Grande ceinture de Bruxelles : Boulevards Lambermont et Auguste Reyers) et Octave Houssa (Rue Royale…) vont marquer la géographie de cette commune.  Jacques Brel  y naquit en 1929.

  Le prix des maisons et surtout des appartements sont un peu moins élevés qu’à Bruxelles-ville.  Les loyers y sont plus abordables.

  Point fort de la commune : La commune est bien desservie en lignes de tram, bus et chemin de fer (deux gares : Schaerbeek au Nord, Meiser au Sud).

  Culture en bref :  Les noms de rue (peintres, sculpteurs…) et le visage de Schaerbeek témoignent d’un riche passé artistique.  La commune favorise encore la culture (www.1030culture.be) : théâtre (140, La Balsamine, Halles de Schaerbeek…), arts plastiques (www.art1030.be)…  Quelques beaux musées sont intéressants parmi lesquels le musée du train (Train World).

  Shopping : La Chaussée de Louvain propose quelques grandes enseignes et  un nombre de petits commerces et  restaurants de diverses nationalités.  Chaque quartier évoqué plus haut a une grande surface, proposant des produits adaptés à sa clientèle.

  Coups de cœur : Déguster une pâtisserie de chez « Van Dender », au 416 Chaussée de Louvain ou se promener au marché organisé le vendredi après-midi (13 à 19 heures), Place des Chasseurs Ardennais.  En terrasse ou à l’intérieur, vous trouverez au « Saint-Hubert », sur la même place, de quoi boire ou bien manger.

  "
  )
c3 = Commune.create!(
  name: "Etterbeek",
  zip_code: "1040",
  description: "Etterbeek vit ses grands événements festifs au printemps (Chasse aux œufs en avril, anniversaire de l’avenue de Tervueren en mai) et en été (Marché médiéval au Cinquantenaire en juin et Etterbeek-village, Place Jourdan en juin).

  La Place Van Meyel est le cœur historique de l’entité.  Elle se situe aujourd’hui au Nord-Ouest de la commune pour une bonne raison : près d’un sixième de l’espace communal, de ce côté, fut amputé au profit de la ville de Bruxelles en 1853.  Le nom d’Etterbeek signifie « ruisseau à l’eau courante » et désigne le Maelbeek qui traversait la commune, du Nord au Sud au niveau de la Place Jourdan.   Village jusqu’au milieu du XIXème siècle, la commune est délimitée au Sud et à l’Est par des grandes avenues tracées fin du XIXème, début du XXème siècle, sous le règne de Léopold II (l’avenue Nouvelle et le Boulevard Général Jacques).

  Acheter une maison à Etterbeek est sensiblement plus cher qu’à Bruxelles-ville.  Par contre, les appartements ont des prix comparables au centre.  La location dans cette commune est la plus onéreuse sur toute la région bruxelloise.

  Point fort de la commune : Proximité des communautés européennes et de la Vrije Universiteit te Brussel.  Offre large de transports publics : trois stations de métro, deux gares ferroviaires, plusieurs lignes de tramway et de bus.

  Culture en bref :  Plusieurs centres culturels (3), théâtres (6), petits musées (3) et galeries d’art (4).  Etterbeek se situe à proximité immédiate des Musées Royaux du Cinquantenaire (Arts Anciens, Autoworld, Armée…)

  Shopping :  La Rue des Tongres abrite des commerces haut de game.  Le quartier de la Chasse (autour de l’Avenue de la Chasse et Chaussée de Wavre) propose des commerces variés.  La commune est quadrillée par différentes grandes surfaces.

  Coups de cœur : La Place Jourdan accueille un marché tous les dimanches.  Les abords du Cinquantenaire et de l’Avenue de Tervuren sont une promenade agréable jalonnée de cafés agréables."
  )
c4 = Commune.create!(
  name: "Ixelles",
  zip_code: "1050",
  description: "Au Sud-Est de Bruxelles-ville, Ixelles présente plusieurs visages.  Au Nord, elle conjugue la diversité des quartiers européen (dit quartier Léopold), « Porte de Namur-Toison d’or » (grandes enseignes et commerces de luxe),  Matonge (ville congolaise dans la ville), Saint-Boniface (lieu branché) et Flagey (coin multiethnique).  Au centre, vous trouverez les étangs d’Ixelles.  L’Université Libre de Bruxelles (ULB) et le cimetière d’Ixelles, au Sud-Est, sont les centres d’un quartier où la vie estudiantine et les restaurants ont une bonne place.  De l’autre côté de l’avenue Louise, enfin, le quartier Bailly-Châtelain offre nombre de petites enseignes pour clients bourgeois-bohèmes.

  Ixelles (en néerlandais Elsene) signifierait « maison voisine des aulnes ».  La commune est le résultat de la fusion en 1795 d’Ixelles-sous-Bruxelles (le Haut-Ixelles près de la porte de Namur, membre de la « cuve de Bruxelles » depuis 1295) d’Ixelles-le-Vicomte (le Bas-Ixelles, près des étangs, dépendant de la Seigneurie de Boondael, attachée à la chapellenie d’Uccle) et du hameau de Boondael.  Durant le XIXème siècle,  Ixelles va être profondément modifiée par le tracé de l’avenue Louise (ouverte à la circulation en 1865), voie partageant la commune en deux et appartenant à Bruxelles-ville.

  Ixelles dispose d’un parc immobilier fort coûteux tant pour les maisons que pour les appartements.  Louer un appartement n’y est pas bon marché.

  Point fort de la commune : Les lignes de tram et bus sillonnent une commune riche en couleur où on passe rapidement de lieux résidentiels chics pour la plupart à des quartiers où l’on peut faire la fête dans un esprit muliculturel.

  Culture en bref :  Des musées d’Ixelles (www.museedixelles.irisnet.be), Wiertz ou Constantin Meunier (www.fine-arts-museum.be) aux théâtres (« Varia » www.varia.be, « Marni » www.theatremarni.com ) en passant par l’incontournable Flagey (www.flagey.be), la commune regorge de propositions culturelles.

  Shopping : Suivant le type d’achats : bon chic bon genre, rendez-vous avenue Louise/Rue du Bailly ou « Porte de Namur/Toison d’or », ou au cimetière d’Ixelles ou encore à la Bascule (sur Uccle) ; pour des achats courants, rendez-vous place Flagey.

  Coups de cœur : Se balader le long des étangs d’Ixelles, les jours de marché « bio » sur la place Flagey toute proche (samedi et dimanche matin)."

  )
c5 = Commune.create!(
  name: "Saint-Gilles",
  zip_code: "1060",
  description: "Saint-Gilles(-Lez-Bruxelles) est une commune cosmopolite.  Au Sud de la Barrière de Saint Gilles,  de belles demeures bourgeoises sont rassemblées dans un ensemble de rues formant un triangle, conception de Victor Besme au XIXème siècle.  Le Nord-Est, dans le quartier dit « des écoles », fort proche de la prestigieuse avenue Louise, vous trouverez beaucoup de maisons mitoyennes au style éclectique ou Art Nouveau.  Le quartier du Midi (autour de la gare), au Nord-Est  est populaire mais il change pour devenir un quartier d’affaires.  Sont fort peuplés, les abords du parc royal au Sud-Ouest et le centre historique de la commune, au Sud de la porte de Halle.

  Obbrussel (ancien nom de Saint-Gilles) apparaît dans les textes en 1216.  Elle fait partie de la « cuve de Bruxelles » (banlieue franchisée autour de Bruxelles) depuis 1296.  C’était alors un petit village maraîcher.  Son territoire accueillera au XVIIème siècle un poste avancé de la porte de Halle, pour la protection du Sud de Bruxelles : le fort Monterrey.  Ce dernier sera démantelé un peu plus d’un siècle plus tard.  Le XIXème siècle verra le développement urbanistique de Saint-Gilles, suivant les tracés de l’architecte voyer Victor Besme.

  Le marché immobilier saint-gillois offre des maisons à des prix comparables à ceux proposés à Bruxelles-ville et des appartements approchant du coût de ceux de Forest.  Vous trouverez des appartements en location assez chers.

  Point fort de la commune : La gare du Midi (S.N.C.B. et Thalys) à l’Ouest, les stations de métro au Nord, les stations de pré-métro, de trams et les arrêts de bus font de Saint-Gilles une commune bien desservie par les transports commun.

  Culture en bref :  Le site www.stgillesculture.irisnet.be reprend nombre d’offres culturelles.  Un lieu incontournable : le musée Horta (situé dans la maison du célèbre architecte art nouveau : www.hortamuseum.be).  Autres propositions intéressantes : le centre culturel Jacques Franck (www.lejacquesfranck.be); la maison du livre (www.lamaisondulivre.be).

  Shopping : La Chaussée de Charleroi dispose de magasins chics à proximité de l’avenue Louise.  Des petits commerces longent les Chaussées de Charleroi et d’Alsemberg et sont concentrés près de la Barrière de Saint-Gilles.

  Coups de cœur : Côté patrimoine, le parc Paulus qui donne vue sur la maison Pelgrims vaut le détour ; côté couleur locale, la friterie de la Barrière de Saint-Gilles est une des plus réputées de Bruxelles ; côté bio, ce sera un brunch le dimanche à la Tricoterie (voir programme d’activités et cartes sur www.tricoterie.be).

  "
  )
c6 = Commune.create!(
  name: "Anderlecht",
  zip_code: "1070",
  description: "Anderlecht est la troisième commune la plus grande de la région bruxelloise après Bruxelles-Ville et Uccle.  Située à l’extrémité ouest, elle est traversée du nord au sud par le périphérique (ring) autoroutier, isolant ainsi deux quartiers semi-ruraux : Neerpede (où se situent le complexe d’entraînement d’une des grandes équipes de football belge, et le domaine du Royale amicale Anderlecht golf Club, seul golf de la région)  et Vogelzang.

  Au XIème siècle, Anderlecht se développe autour de la place de la Vaillance et de la Collégiale Saints-Pierre-et-Guidon.  Ce centre historique est entouré de deux édifices incontournables : la maison d’Erasme (philosophe humaniste qui y habita en 1521) et le béguinage.  L’habitat mixte de la commune s’explique par l’histoire variée des anciens hameaux qui se sont joints au centre historique, de part et d’autre de la chaussée de Mons : de Cureghem au passé industriel (consécutif au développement du canal Bruxelles-Charleroi à partir de 1827) au Pajottenland et son caractère agricole (fermes, moulin…).

  Le marché immobilier anderlechtois est parmi les plus abordables de la capitale, tant pour l’achat d’un bien neuf, d’un bien construit que pour la location.  Ces prix relativement modérés s’expliquent par le caractère plus populaire de la commune lié à son passé industriel.

  Point fort de la commune : De nombreuses stations de métro  (10) jalonnent l’est de la commune tandis qu’à l’ouest, le Ring permet un accès autoroutier facile.

  Culture en bref :  Diversité de propositions : 11 musées (parmi lesquels, maison d’Erasme, ceux de la gueuze, de plein air…), diverses associations dynamiques.  Toutes les informations pratiques se trouvent dans une brochure disponible sur le site de la commune (voir-ci-dessus).

  Shopping :  La rue Wayez, autrefois rutilante, voit sa place contestée par le Westland Shopping Center.

  Coups de cœur : Anderlecht et ses marchés.  Deux marchés très colorés se tiennent chaque semaine : le marché du Midi (à l’intersection avec la commune de Saint-Gilles), le dimanche matin et le marché des Abattoirs d’Anderlecht du vendredi au dimanche matin.  Le marché annuel, au mois de septembre, se tient sur la place de la Vaillance."
  )
c7 = Commune.create!(
  name: "Molenbeek-Saint-Jean",
  zip_code: "1080",
  description: "Molenbeek-Saint-Jean s’étend à l’ouest de Bruxelles-ville, sur l’autre rive du canal reliant la capitale à Anvers d’un côté (XVIème siècle) et à Charleroi de l’autre (XIXème siècle).  La commune est densément peuplée.

  A l’origine, « Meulebeek » se développe autour d’un cours d’eau du même nom et des moulins (activités pré-industrielles) sur son territoire.  .  Liée administrativement à la « Cuve de Bruxelles » dès 1295, Molenbeek-Saint-Jean restera un petit village à proximité de Bruxelles-ville.  Au XIXème siècle, la commune participe au développement industriel de la Belgique en accueillant de nombreuses industries.  Le centre historique a reçu le surnom de « petit Manchester belge »  En parallèle, l’entité attire une population ouvrière qui, depuis, a été remplacée par une vague successive de nouveaux habitants.

  Le logement est très abordable à Molenbeek-Saint-Jean, tant pour un achat que pour une location (la commune développa un parc de logement sociaux très important).  L’habitat populaire explique cet état de fait.

  Point fort de la commune : Multiculturelle, jeune et dynamique.

  Culture en bref :  Trois lieux à découvrir : la maison des cultures (www.lamaison1080hethuis.be), la fonderie (www.lafonderie.be) et le château du Karreveld, où le cinéma belge fit ses premiers pas et où de nombreuses pièces de théâtre se jouent en plein air en été (www.bruxellons.be).  Pour plus de détails, allons voir www.culture1080cultuur.be.

  Shopping :  La chaussée de Gand présente de nombreuses enseignes commerciales

  Coups de cœur : Parmi les quelques parcs que compte la commune, celui du Scheutbos sort du lot.  Avec ses 6 hectares, il propose un lieu tant récréatif qu’écologique. Outre ses qualités propres, il est relié au site du Scheutbos, lui-même s’étendant sur une superficie de 50 hectares."
  )
c8 = Commune.create!(
  name: "Woluwe-Saint-Pierre",
  zip_code: "1080",
  description: "Woluwe Saint-Pierre est avant tout résidentielle, prospère et riche en espaces verts (20 % de son territoire).  Elle tient son nom du cours d’eau (la Woluwe) qui la traverse du Sud au Nord où elle rejoint Woluwe-Saint-Lambert, sa voisine.  L’avenue de Tervueren est une voie majestueuse qui, depuis le non moins prestigieux Rond-Point Montgomery à l’Ouest, traverse toute la commune pour rejoindre Tervueren, son parc et son musée (en transformation).  La commune est calme et est très proche des institutions européennes.

  Les origines de Woluwe remonteraient au moins au XIème siècle.  Le centre villageois est attesté de manière certaine en 1173, en lien étroit, semble-t-il avec Woluwe-Saint-Lambert sa voisine.  Trois villages de Woluwe coexistent avant de se distinguer au XIIIème siècle par leur patron différent : Saint-Pierre, Saint-Lambert et Saint-Etienne.  La commune s’est développée autour de plusieurs centres historiques : l’église Saint-Pierre, le hameau du Bemel (du nom d’un affluent de la Woluwe), Stockel, le Bovenberg et Kelleweg. Rurale jusqu’à la fin du XIXème siècle, Woluwe-Saint-Pierre change profondément lors de la percée de l’avenue de Tervueren sans pour autant perdre son caractère aéré.  De nouveaux quartiers résidentiels se développeront après la 1ère guerre mondiale : Saint-Michel, Chant d’Oiseau, Joli-Bois et Saint-Paul.

  Après Uccle, Woluwe-Saint-Pierre est la plus florissante des communes bruxelloises.  Les prix des maisons, appartements sont, en conséquence, très élevés.  Les loyers y sont aussi chers.

  Point fort de la commune : A l’extrémité Ouest (Montgomery) et à l’extrémité Est (Stockel), deux stations de métro viennent compléter une offre en transport en commun faite de trams et bus qui permet de rejoindre facilement le centre-ville.  Le périphérique routier (Ring) extérieur n’est pas loin.

  Culture en bref : Plusieurs théâtres (Comédie Claude Volter www.comedievolter.be, Compagnie « Les copains d’abord » www.copains-dabord.be, les Trouvères www.lestrouveres.be), deux musées (Bibliotheca Witockiana, transports urbains), Woluwé-Saint-Pierre compte aussi des monuments d’histoire : le manoir d’Anjou, le palais Stoclet…

  Shopping : Stockel dispose d’un centre commercial très varié.  Rob est un magasin d’alimentation gastronomique situé Boulevard de la Woluwe, à quelques encablures du W Shopping Center (voir Woluwe-Saint-Lambert)

  Coups de cœur : Se promener le long des Etangs Mellaerts. S’il fait beau, tenter une balade en barque ou en pédalo.  S’il fait moins beau, boire un verre à la brasserie toute proche…

  "
  )
c9 = Commune.create!(
  name: "Woluwe-Saint-Lambert",
  zip_code: "1200",
  description: "Traversée du nord au sud par la Woluwe (rivière qui lui a donné son nom) Woluwe-Saint-Lambert est une commune où l’aspect résidentiel est prédominant.  Le boulevard de la Woluwe jouxte l’ancien cours d’eau et les espaces verts qui l’entourent (Parc Malou, parc Neerveld…) pour rejoindre l’avenue de Tervuren dans la commune voisine de Woluwe-Saint-Pierre.  La population de la commune est variée et plutôt prospère.

  L’origine de Woluwe-Saint-Lambert remonterait au XIème siècle.  Le village s’est développé à l’orée du bois de Linthout situé à l’ouest, et près de la Woluwe située à l’est autour de l’Eglise Saint-Lambert, dans le sud de la commune actuelle.  Il faut attendre le XXème siècle pour que la commune s’urbanise, voyant s’élever dans son écrin des quartiers bourgeois (quartier Saint-Henri, de Linthout, Square Vergote, Avenue de Broqueville…) et populaire (quartier des Constellations).  Autour du Boulevard de la Woluwe, se sont installés de nombreux commerces, entreprises ainsi que le complexe médical de Louvain-en-Woluwe (UCL).

  Les prix de maison sont parmi les plus élevés de la région bruxelloise.  Acheter un appartement y est proportionnellement plus abordable.  Par contre, les loyers se situent en moyenne dans les plus chères.

  Point fort de la commune : La commune est traversée d’Est en Ouest par la ligne de métro (six stations).  Quelques lignes de bus complètent cet axe majeur.  Woluwe-Saint-Lambert est une des communes résidentielles les plus agréables de la capitale.  L’autouroute de Louvain-Liège lui permet d’avoir un accès rapide au périphérique (Ring) et à l’extérieur de la ville.

  Culture en bref :  Wolubilis est le village culturel de Woluwe-Saint-Lambert.  Inauguré en 2006, il a la particularité de rassembler autour d’une place, une salle de spectacles, des bâtiments accueillant diverses associations culturelles ainsi que des commerces (cafés, restaurants, librairie…).  Pour les activités qui y sont proposées, rendez-vous sur www.wolubilis.be

  Shopping : Woluwe-Saint-Lambert est doté d’un centre commercial couvert aux enseignes les plus réputées: the W shopping center (anciennement Woluwé-Shopping Center : www.thewshopping.be).  L’avenue Georges Henri présente  des commerces variés (www.ghshopping.be).

  Coups de cœur : Se promener le long du circuit de la promenade verte permet de s’échapper de la ville en empruntant, depuis la rue L. Jasmin, l’ancien tracé de la ligne de chemin de fer « Bruxelles-Tervueren », en traversant le Parc Malou (avenue du Stade) et en longeant la Woluwe (découverte du Lindekemaele, repas dans le restaurant Le Slot, reste d’un château du XVIème siècle."
  )
c10 = Commune.create!(
  name: "Uccle",
  zip_code: "1180",
  description: "Commune très chic, Uccle est la deuxième en taille après Bruxelles-ville et la quatrième en quantité de population.  Elle  est entourée d’écrins de verdure : le bois de la Cambre jusqu’à la forêt de Soignes, à l’est et le circuit de la promenade verte qui longe Uccle du nord-ouest au sud-est pour rejoindre ladite forêt de Soignes qui occupe un quart de la surface de la commune.  Plusieurs parcs jalonnent Uccle parmi lesquels le Wolvendael.

  Si la légende la fait remonter plus loin encore, Uccle est mentionnée pour la première fois au XIème siècle.  Elle se développe près de la Chaussée d’Alsemberg (qui, elle remonte au début du XVIIIème siècle), dans le cœur historique, sur le Parvis de l’église Saint-Pierre.  Bien à l’est se dessine la vieille chaussée de Waterloo (fin du Moyen Age).  La commune fut formée en 1795 par l’ajout des seigneuries de Carloo-Saint-Job et de Stalle-Overhem.  L’avenue Brugmann  (du nom du riche banquier qui en fut l’initiateur) s’inscrit dans le paysage  en 1873.  Depuis lors, Uccle se développe avec ses quartiers populaires dans le nord essentiellement (les « carrés », groupe de petites habitations ouvrières, quartier du Chat) et ses quartiers résidentiels huppés situés du côté de l’Observatoire et dans le sud avec ses nombreuses villas.

  Acheter un bien immobilier à Uccle est une marque de standing.  Pas étonnant dès lors d’y voir les prix les plus élevés de toute la région bruxelloise pour les maisons, villas et appartements.  Etonnamment, la location d’appartement est un peu moins cher, même si elle reste assez élevée.

  Point fort de la commune : aérée, Uccle présente un côté « sous-bois » vraiment charmant.  Plusieurs lignes de tram et de bus complètent les cinq gares de chemin de fer d’Uccle-Calevoet, Uccle-Stalle, Moensberg, Saint-Job et Vivier d’oie.

  Culture en bref :  Le centre culturel d’Uccle (www.ccu.be) offre de nombreuses propositions de spectacles théâtraux, musicaux et cinématographiques.  Exploration du monde y propose la projection de films documentaires géographiques.

  Shopping : Plusieurs quartiers rassemblant des commerces de standing se situent sur le territoire ucclois : le quartier Saint-Job sur la chaussée de Waterloo ou le croisement entre la chaussée d’Alsemberg et la rue Xavier de Bue.

  Coups de cœur : Le marché de Saint-Job se tient tous les lundis de 9 à 13 heures et ce depuis 35 ans.  Quelques bonnes tables se situent à proximité de la place Saint-Job où se tient le marché.

  ")


puts "Creating communes data OK."
