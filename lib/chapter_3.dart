final Map<int, Map<String, dynamic>> chapter3 = {

  // --- 3000: THE MORNING SPLIT ---
  3000: {
    "image": "assets/images/morning_mist.jpg",
    "music": "bg_music_day_3.mp3",
    "nextIndex1": 3001,
    "nextIndex2": 3002,
    "en": {
      "text": "The third morning brings a soft, pearlescent mist that clings to the valley floor like a cooling breath. Elara wakes not to an alarm, but to the gentle, rhythmic tapping of a songbird against the loft window, its tiny beak a percussion against the glass. The light filtering through the haze is weak but promising, casting long, pale shadows across the wooden floorboards of her sleeping quarters.\n\nWhen she wanders out to the garden with her morning tea, she gasps. In the dark, rich soil where she labored yesterday, tiny, vibrant shoots have already pierced the surface. They aren't green, but a deep, shimmering indigo - the Midnight Blue petals. They seem to pulse with a faint, internal light, defying the natural laws of growth she had learned in her city life.\n\nSeeing them makes her realize that this house isn't just a building. It's a living legacy that breathes alongside her. Inspired by the sudden growth, she decides where she must seek her own answers today. The connection between the earth and her own family history is becoming impossible to ignore, and the pull of the unknown feels more like a welcoming embrace than a frightening mystery.",
      "choice1": "Climb the attic ladder",
      "choice2": "Check the old mailbox"
    },
    "cs": {
      "text": "Třetí ráno přináší jemnou, perleťovou mlhu, která se drží na dně údolí jako chladivý dech. Elara se neprobouzí za zvuku budíku, ale díky jemnému, rytmickému ťukání ptáčka na okno v podkroví, jehož drobný zobáček bubnuje do skla. Světlo pronikající oparem je slabé, ale slibné, a vrhá dlouhé, bledé stíny přes dřevěná prkna podlahy v její ložnici.\n\nKdyž se s ranním čajem vydá na zahradu, zalapá po dechu. V temné, bohaté půdě, na které včera pracovala, už prorazily na povrch drobné, živoucí výhonky. Nejsou zelené, ale mají hlubokou, třpytivou indigovou barvu – okvětní lístky Půlnoční modři. Zdá se, že pulzují slabým vnitřním světlem, které popírá přirozené zákony růstu, jež se naučila během svého života ve městě.\n\nPohled na ně jí dává uvědomit, že tento dům není jen budovou. Je to živoucí odkaz, který dýchá spolu s ní. Inspirována tímto náhlým růstem se rozhoduje, kde dnes bude hledat své vlastní odpovědi. Spojení mezi zemí a její vlastní rodinnou historií začíná být nemožné ignorovat a vábení neznáma působí spíše jako vítající náruč než jako děsivé tajemství.",
      "choice1": "Vylézt po žebříku na půdu",
      "choice2": "Zkontrolovat starou schránku"
    }
  },

  // ==========================================
  // --- BRANCH A: THE ATTIC ---
  // ==========================================

  3001: {
    "image": "assets/images/attic_ladder.jpg",
    "nextIndex1": 3033, 
    "nextIndex2": 3034, 
    "en": {
      "text": "The attic ladder feels sturdy but groans with the history of many ascents. As Elara climbs, the temperature rises slightly, and the air becomes thick with the scent of old paper, beeswax, and forgotten summers. Each step upward feels like a transition through time, leaving the modern world further behind with every creak of the wood.\n\nThe space is a sanctuary of amber light, filtered through a layer of fine dust that dances in the sunbeams. In the center of the room sits a heavy steamer trunk, its leather straps worn smooth and its brass locks dulled by decades of stillness. Piles of old quilts and crates of ceramic dishes line the walls, acting as silent witnesses to the generations that have passed through this home.\n\nEverything here feels paused, as if the room has been holding its breath for her arrival. She stands at the top of the ladder, looking at the treasures of a life well-lived. There is a profound sense of responsibility in being the one to finally exhale into this stagnant air and set the wheels of history in motion once again.",
      "choice1": "Approach the trunk",
      "choice2": "Look out the gable window"
    },
    "cs": {
      "text": "Žebřík na půdu působí pevně, ale sténá pod tíhou historie mnoha výstupů. Jak Elara stoupá, teplota se mírně zvedne a vzduch houstne vůní starého papíru, včelího vosku a zapomenutých let. Každý krok vzhůru působí jako přechod časem, kdy s každým zavrzáním dřeva nechává moderní svět dál za sebou.\n\nProstor je svatyní jantarového světla, filtrovaného vrstvou jemného prachu, který tančí ve slunečních paprscích. Uprostřed místnosti stojí těžký lodní kufr, jehož kožené řemeny jsou ohlazené a mosazné zámky zašlé desítkami let nečinnosti. Stohy starých přikrývek a bedny s keramickým nádobím lemují stěny jako tiší svědci generací, které tímto domovem prošly.\n\nVše zde působí pozastaveně, jako by místnost tajila dech a čekala na její příchod. Stojí na vrcholu žebříku a hledí na poklady dobře prožitého života. Cítí hluboký pocit zodpovědnosti za to, že je tou, která do tohoto stojatého vzduchu konečně vydechne a znovu uvede kola historie do pohybu.",
      "choice1": "Přistoupit ke kufru",
      "choice2": "Vyhlédnout ze štítového okna"
    }
  },

  3033: {
    "image": "assets/images/trunk_touch.jpg",
    "sfx": "trunk_touch.mp3",
    "nextIndex1": 3035,
    "en": {
      "text": "As Elara reaches out to touch the lid, the metal feels surprisingly cold despite the warmth of the room. A faint, electric hum seems to travel up her fingertips, a static charge from a suitcase that has traveled the world. It is a startling sensation that makes the hair on her arms stand up, anchoring her completely to the physical object before her.\n\nShe traces the embossed initials on the leather, imagining Bella packing this trunk for journeys across oceans and mountains. The scratches and scuffs on the surface tell a story of rough docks, steam engines, and taxi rides through rain-slicked streets. Every mark is a badge of honor from a life spent in pursuit of wonder.\n\nIt feels less like a box and more like a time capsule vibrating with the kinetic energy of the past. Elara hesitates for a moment, wondering if she is truly ready to unlock the secrets contained within. The hum against her skin grows stronger, as if the trunk itself is urging her to finally reveal its hidden contents.",
      "choice1": "Lift the heavy lid"
    },
    "cs": {
      "text": "Když Elara natáhne ruku, aby se dotkla víka, kov působí překvapivě chladně navzdory teplu v místnosti. Zdá se, že jí do konečků prstů putuje slabé, elektrické hučení, statický náboj z kufru, který procestoval svět. Je to překvapivý pocit, ze kterého jí naskočí husí kůže a který ji zcela ukotví k fyzickému objektu před ní.\n\nPrstem přejíždí po iniciálách vyražených na kůži a představuje si Bellu, jak balí tento kufr na cesty přes oceány a hory. Škrábance a oděrky na povrchu vyprávějí příběh o drsných přístavech, parních strojích a jízdách taxíkem deštěm smáčenými ulicemi. Každá stopa je čestným odznakem života stráveného hledáním zázraků.\n\nPůsobí to méně jako krabice a více jako časová schránka vibrující kinetickou energií minulosti. Elara na okamžik zaváhá a přemýšlí, zda je skutečně připravena odemknout tajemství ukrytá uvnitř. Hučení proti její kůži sílí, jako by ji kufr sám vybízel, aby konečně odhalila jeho skrytý obsah.",
      "choice1": "Zvednout těžké víko"
    }
  },

  3034: {
    "image": "assets/images/attic_view.jpg",
    "sfx": "attic_view.mp3",
    "nextIndex1": 3035,
    "en": {
      "text": "She walks over to the small, circular gable window. From this height, the valley is a masterpiece of textures - the velvet green of the groves, the silver thread of the stream, and the terracotta roofs of the distant village. The perspective from up here shifts everything, making the grandest problems seem like small, manageable details in a much larger painting.\n\nShe realizes that from up here, everything looks connected. The 'grey' isolation she felt in the city has no place in this panorama, where every tree and stone seems to play a vital role in the landscape. It is a relief to see the world as a cohesive whole rather than a series of disconnected tasks and digital notifications.\n\nShe takes a deep breath of the attic air, feeling grounded yet light, before turning back to the business of the trunk. The clarity she gained from the window view provides her with a new sense of courage. With a final look at the horizon, she steps back into the shadows of the attic, ready to confront the physical remnants of her aunt's legacy.",
      "choice1": "Turn back to the trunk"
    },
    "cs": {
      "text": "Přejde k malému kruhovému okénku ve štítu. Z této výšky je údolí mistrovským dílem textur - sametová zeleň hájů, stříbrná nit potoka a terakotové střechy vzdálené vesnice. Perspektiva odsud shora vše mění a dává největším problémům zdání malých, zvládnutelných detailů v mnohem větším obraze.\n\nUvědomuje si, že odsud shora vypadá vše propojené. Ta ‘šedá’ izolace, kterou cítila ve městě, nemá v tomto panoramatu místo. Každý strom a kámen hraje v krajině svou zásadní roli. Je to úleva vidět svět jako soudržný celek spíše než jako řadu nesouvisejících úkolů a digitálních oznámení.\n\nZhluboka se nadechne vzduchu půdy, cítí se uzemněná a přitom lehká, než se vrátí zpět k záležitosti s kufrem. Jasnost, kterou získala pohledem z okna, jí dodává nový pocit odvahy. S posledním pohledem na obzor ustoupí zpět do stínů půdy, připravena čelit fyzickým pozůstatkům tetina odkazu.",
      "choice1": "Obrátit se zpět ke kufru"
    }
  },

  3035: {
    "image": "assets/images/trunk_interior.jpg",
    "sfx": "trunk_interior.mp3",
    "nextIndex1": 3036, 
    "nextIndex2": 3037, 
    "en": {
      "text": "The lid creaks open to reveal a treasure trove of sensory memories. Inside are layers of silk scarves from Florence, dried Alpine wildflowers pressed into bundles, and a leather-bound sketchbook that feels heavy with the weight of untold secrets. The organization of the items is purposeful, suggesting that each piece was placed here with a specific memory in mind.\n\nThe scent of cedarwood and old dreams wafts up, intoxicating and comforting all at once. Elara’s heart flutters as she realizes these weren't just objects to Bella. They were the anchors of her identity, kept safe beneath the rafters. The colors of the fabric remain remarkably bright, preserved by the darkness of the trunk for all these years.\n\nShe reaches into the trunk, her hands hovering over the delicate fabrics and the sturdy spine of the book, wondering which thread of the past to pull first. There is an overwhelming sense of intimacy in this moment, as if she is finally having the conversation with her aunt that she never got to finish. She lets her fingers drift, waiting for an intuition to guide her choice.",
      "choice1": "Pick up a silk scarf",
      "choice2": "Open the sketchbook"
    },
    "cs": {
      "text": "Víko s vrzáním odhalí pokladnici smyslových vzpomínek. Uvnitř jsou vrstvy hedvábných šátků z Florencie, sušené alpské květy svázané do svazků a v kůži vázaný skicář, který působí těžce vahou nevyřčených tajemství. Uspořádání věcí je záměrné a naznačuje, že každý kus sem byl vložen s konkrétní vzpomínkou na mysli.\n\nVůně cedrového dřeva a starých snů stoupá vzhůru, omamná a uklidňující zároveň. Elaře se rozbuší srdce, když si uvědomí, že pro Bellu to nebyly jen věci. Byly to kotvy její identity, uchované v bezpečí pod krovem. Barvy látek zůstávají neuvěřitelně jasné, po všechna ta léta chráněné temnotou kufru.\n\nSáhne do kufru, ruce se jí vznášejí nad jemnými látkami a pevným hřbetem knihy a přemýšlí, za kterou nit minulosti zatáhne jako první. V tomto okamžiku je cítit ohromující pocit intimity, jako by konečně vedla rozhovor se svou tetou, který nikdy nestihly dokončit. Nechá své prsty bloudit a čeká, až její volbu povede intuice.",
      "choice1": "Zvednout hedvábný šátek",
      "choice2": "Otevřít skicář"
    }
  },

  3036: {
    "image": "assets/images/scarf_touch.jpg",
    "sfx": "scarf_touch.mp3",
    "nextIndex1": 3038,
    "en": {
      "text": "The silk is impossibly soft and cool against her skin, almost like liquid water. It is dyed a vibrant shade of terracotta, the exact color of a Tuscan sunset captured in fabric. As she lifts it, the material catches the dim attic light, shimmering with a quality that seems almost ethereal compared to the dusty surroundings.\n\nAs she drapes it over her arm, Elara feels a surge of borrowed confidence. Bella must have worn this in the piazza, dancing in the rain or laughing over wine with friends who are now only names in old letters. The scarf carries the faint, lingering scent of a perfume she doesn't recognize - something spicy and sophisticated.\n\nBeneath the scarf, her fingers brush against a stiff piece of parchment tucked into a side pocket. It feels different from the other papers she has found - thicker and more durable. She pulls it out carefully, realizing that this wasn't just left here by accident, but was hidden away for someone with the patience to look deeper.",
      "choice1": "Find the map beneath it"
    },
    "cs": {
      "text": "Hedvábí je neuvěřitelně jemné a chladí ji na kůži, skoro jako tekoucí voda. Je obarvené na zářivý odstín terakoty, což je přesně barva toskánského západu slunce zachycená v látce. Jak jej zvedá, materiál zachycuje tlumené světlo z půdy a třpytí se kvalitou, která v porovnání s prašným okolím působí téměř nadpozemsky.\n\nKdyž si ho přehodí přes ruku, Elara pocítí příval vypůjčeného sebevědomí. Bella ho musela nosit na náměstí, tančit s ním v dešti nebo se smát u vína s přáteli, kteří jsou nyní už jen jmény ve starých dopisech. Šátek nese slabou, přetrvávající vůni parfému, který nepoznává - něco kořeněného a sofistikovaného.\n\nPod šátkem její prsty narazí na tuhý kus pergamenu zastrčený v boční kapse. Působí jinak než ostatní papíry, které našla - je silnější a odolnější. Opatrně ho vytáhne a uvědomí si, že tu nebyl ponechán jen náhodou, ale byl skryt pro někoho, kdo má trpělivost hledat hlouběji.",
      "choice1": "Najít pod ním mapu"
    }
  },

  3037: {
    "image": "assets/images/sketchbook_open.jpg",
    "nextIndex1": 3038,
    "en": {
      "text": "The sketchbook opens with a satisfying crack of the spine. The pages are thick, creamy, and filled with charcoal drawings of local life: laughing fruit sellers, sleeping cats, and the very bench where Elara sat last night. The level of detail is astounding, capturing the tiny wrinkles in a smile or the specific way the light hits the valley walls at noon.\n\nBella’s art wasn't just about beauty. It was about observation. She saw the soul in the mundane, elevating everyday moments into something sacred. As Elara flips through, she notices that the drawings become more abstract toward the end, focusing on light and energy rather than physical forms.\n\nA loose sheet of paper slides out from the back cover, covered in delicate ink lines and gold leaf accents. It stands out from the charcoal sketches, looking more like a formal document or a stylized guide. She catches it before it hits the floor, noticing that the ink seems to shimmer when she tilts it toward the sun.",
      "choice1": "Look at the loose map"
    },
    "cs": {
      "text": "Skicář se otevře se spokojeným zavrzáním hřbetu. Stránky jsou silné, smetanové a plné kreseb uhlem z místního života: smějící se prodavač ovoce, spící kočky a přesně ta lavička, na které Elara včera seděla. Úroveň detailů je ohromující, zachycuje drobné vrásky v úsměvu nebo specifický způsob, jakým světlo v poledne dopadá na stěny údolí.\n\nBellino umění nebylo jen o kráse, bylo o pozorování. Viděla duši v obyčejných věcech a povyšovala každodenní okamžiky na něco posvátného. Jak Elara listuje, všimne si, že kresby se ke konci stávají abstraktnějšími a soustředí se spíše na světlo a energii než na fyzické formy.\n\nZe zadní strany desek vyklouzne volný list papíru, pokrytý jemnými inkoustovými čarami a akcenty z plátkového zlata. Vyčnívá mezi skicami uhlem a vypadá spíše jako oficiální dokument nebo stylizovaný průvodce. Zachytí ho dříve, než dopadne na podlahu, a všimne si, že inkoust se při naklonění ke slunci třpytí.",
      "choice1": "Podívat se na volnou mapu"
    }
  },

  3038: {
    "image": "assets/images/bella_map.jpg",
    "sfx": "bella_map.mp3",
    "nextIndex1": 3039, 
    "nextIndex2": 3040, 
    "en": {
      "text": "The hand-drawn map is a work of art in itself. It doesn't show roads or property lines. Instead, it marks 'Points of Stillness' - hidden spots in the valley where the world feels most aligned. The parchment is soft from being folded and unfolded many times, yet the ink remains crisp and clear.\n\nA small gold star is placed carefully by the old Roman Bridge, accompanied by a note in Bella’s handwriting: 'For when the world is too loud, and your own voice is a whisper.' The words are written with a steady hand, conveying a sense of peace that Elara desperately wishes to find for herself.\n\nElara feels a pull toward the valley, a sense that this map was left specifically for her to find when the timing was right. It isn't just a guide to the terrain, but a guide to a state of mind. She folds the map carefully and tucks it into her pocket, her heart beating with the anticipation of a pilgrimage.",
      "choice1": "Follow the map",
      "choice2": "Study the gold star carefully"
    },
    "cs": {
      "text": "Ručně kreslená mapa je sama o sobě uměleckým dílem. Neukazuje cesty ani hranice pozemků. Místo toho označuje „Body klidu“ - skrytá místa v údolí, kde svět působí nejvíce v souladu. Pergamen je měkký od toho, jak byl mnohokrát složen a rozložen, přesto inkoust zůstává ostrý a jasný.\n\nMalá zlatá hvězda je pečlivě umístěna u starého římského mostu, doplněná poznámkou Belliným písmem: ‘Pro chvíle, kdy je svět příliš hlučný a tvůj vlastní hlas je jen šepotem.’ Slova jsou napsána pevnou rukou a vyjadřují pocit klidu, který by Elara pro sebe tak zoufale chtěla najít.\n\nElara cítí, jak ji to táhne do údolí, pocit, že tato mapa tu byla ponechána právě pro ni, aby ji našla v tu správnou chvíli. Není to jen průvodce terénem, ale průvodce stavem mysli. Mapu pečlivě složí a zastrčí do kapsy, srdce jí buší očekáváním poutě.",
      "choice1": "Následovat mapu",
      "choice2": "Pečlivě prostudovat zlatou hvězdu"
    }
  },

  3039: {
    "image": "assets/images/walking_path.jpg",
    "sfx": "walking_path.mp3",
    "nextIndex1": 3003,
    "en": {
      "text": "Elara leaves the house with a newfound sense of purpose, the map tucked securely in her pocket. The air outside is crisp, carrying the scent of wild thyme and the distant promise of pine from the mountain peaks. The morning mist has mostly burned off, leaving the valley in a state of high-contrast brilliance.\n\nThe path is narrow and winding, lined with tall grass that whispers against her shins as she walks. Insects buzz among the wildflowers, and the occasional lizard scuttles across the sun-warmed rocks. Every sound feels amplified, as if the valley itself is leaning in to watch her progress.\n\nWith every step toward the valley floor, the noise of her past life feels further away, replaced by the rhythmic crunch of gravel under her boots. The mental tally of chores and anxieties begins to fade, replaced by a singular focus on the path ahead. She is no longer a visitor. She is a traveler on a trail blazed by her own blood.",
      "choice1": "Reach the bridge"
    },
    "cs": {
      "text": "Elara opouští dům s nově nalezeným pocitem odhodlání, mapu má bezpečně zastrčenou v kapse. Vzduch venku je svěží, nese vůni divokého tymiánu a vzdálený příslib jehličí z horských štítů. Ranní mlha se už většinou rozplynula a nechala údolí ve stavu vysoce kontrastního jasu.\n\nCesta je úzká a klikatá, lemovaná vysokou trávou, která jí při chůzi šustí o holeně. Mezi divokými květinami bzučí hmyz a po sluncem vyhřátých skalách občas přeběhne ještěrka. Každý zvuk působí zesíleně, jako by se samo údolí naklánělo, aby sledovalo její postup.\n\nS každým krokem směrem k údolí se hluk jejího minulého života zdá vzdálenější, nahrazený rytmickým vrzáním štěrku pod botami. Mentální seznam povinností a úzkostí začíná blednout a je nahrazen jediným soustředěním na cestu před sebou. Už není návštěvnicí. Je poutnicí na stezce, kterou prošlapala její vlastní krev.",
      "choice1": "Dojít k mostu"
    }
  },

  3040: {
    "image": "assets/images/map_detail.jpg",
    "nextIndex1": 3039,
    "en": {
      "text": "She pauses on the porch to study the gold star. The ink is slightly raised, textured with real gold leaf that catches the morning light. It shimmers with a quiet intensity, as if it’s a beacon rather than just a mark on paper. She wonders how many times her aunt stood on this very spot, looking at this same star before heading out into the wild.\n\nIt feels like a promise from her aunt - a reminder that in this valley, she is never truly lost. The gold leaf seems to hold the warmth of the sun, radiating a small sense of comfort through her fingertips. It is a tactile connection to a woman she is only just beginning to truly understand.\n\nReassured, she sets off toward the coordinates of her heritage. She walks with a firmer gait now, no longer second-guessing her decision to leave the city behind. The map is her compass, but her heart is finally beginning to find its own true north.",
      "choice1": "Follow the map"
    },
    "cs": {
      "text": "Zastaví se na verandě, aby prostudovala zlatou hvězdu. Inkoust je mírně vystouplý, texturovaný pravým plátkovým zlatem, které zachycuje ranní světlo. Třpytí se s tichou intenzitou, jako by to byl spíše maják než jen značka na papíře. Přemýšlí, kolikrát její teta stála přesně na tomto místě a hleděla na stejnou hvězdu, než vyrazila do divočiny.\n\nPůsobí to jako slib od tety - připomínka, že v tomto údolí není nikdy skutečně ztracená. Zdá se, že plátkové zlato v sobě drží teplo slunce a skrze její konečky prstů vyzařuje drobný pocit útěchy. Je to hmatové spojení s ženou, kterou teprve začíná skutečně chápat.\n\nS tímto ujištěním se vydává směrem k souřadnicím svého dědictví. Nyní kráčí pevnějším krokem a už nepochybuje o svém rozhodnutí opustit město. Mapa je jejím kompasem, ale její srdce konečně začíná nacházet svůj vlastní skutečný sever.",
      "choice1": "Následovat mapu"
    }
  },

  3003: {
    "image": "assets/images/roman_bridge.jpg",
    "sfx": "roman_bridge.mp3",
    "nextIndex1": 3023, 
    "en": {
      "text": "Following the map feels like walking through a dream. The path leads her to a hidden glade where an ancient Roman bridge arches gracefully over a crystal-clear stream. The stones are covered in silver-green lichen, and the water below hums a meditative song. Ferns drape over the banks, dipping their tips into the cool, rushing current.\n\nElara finds the exact spot marked with the gold star - a flat, sun-warmed rock perfectly shaped for sitting. As she rests there, the world seems to slow down. She isn't thinking about the past or worrying about the future. The constant 'internal chatter' of her mind finally finds its mute button. She is simply listening to the water and the wind.\n\nEventually, she folds the map and stands, feeling lighter than she has in years. As she starts the walk back through the high meadows, she feels a deep sense of belonging. The path home is no longer a destination, but a continuation of this peace. As she rounds a bend in the stone-walled path, she sees a figure ahead in the distance.",
      "choice1": "Head back toward home"
    },
    "cs": {
      "text": "Následovat mapu je jako procházet snem. Cesta ji zavede na skrytou mýtinu, kde se starobylý římský most elegantně klene nad křišťálově čistým potokem. Kameny jsou pokryty stříbřitě zeleným lišejníkem a voda pod nimi si pobrukuje meditativní píseň. Kapradiny se sklánějí nad břehy a smáčejí své špičky v chladném, prudkém proudu.\n\nElara najde přesné místo označené zlatou hvězdou - plochý, sluncem vyhřátý kámen, který má dokonalý tvar pro sezení. Jak tam tak odpočívá, svět se zdá být ještě pomalejší. Nepřemýšlí o minulosti ani se nestrachuje o budoucnost. Neustálé ‘vnitřní štěbetání’ její mysli konečně našlo tlačítko pro ztlumení. Jednoduše naslouchá vodě a větru.\n\nNakonec mapu složí a vstane, cítí se lehčí než za celé roky. Když se vydává na cestu zpět přes vysoké louky, cítí hluboký pocit sounáležitosti. Cesta domů už není cílem, ale pokračováním tohoto klidu. Když zahne za zatáčku cesty lemované kamennou zdí, spatří v dálce před sebou nějakou postavu.",
      "choice1": "Vydat se na cestu domů"
    }
  },

  // ==========================================
  // --- BRANCH B: THE LIBRARY ---
  // ==========================================

  3002: {
    "image": "assets/images/postcard_hand.jpg",
    "sfx": "postcard_hand.mp3",
    "nextIndex1": 3016, 
    "en": {
      "text": "The iron mailbox is cool and damp with morning dew. Inside, she finds no bills or advertisements, only a small, hand-painted postcard from a neighbor named Sofia. It features a watercolor of a single, glowing candle against a twilight blue sky, its flame rendered with a thick, textured dab of yellow paint.\n\n'The key to the Old Chapel library is under the loose brick by the heavy oak door,' the message reads. 'It is the quietest place in the world, and I thought you might need its silence today. Help yourself to the tea on the stove.' The handwriting is elegant and hospitable, welcoming her into a circle of trust she hasn't yet earned but is grateful to receive.\n\nElara smiles, feeling the gentle tug of a community that seems to understand her needs before she even speaks them. This kind of intuitive kindness was non-existent in her previous life, where every interaction was transactional. She tucks the card into her pocket and heads toward the village outskirts, curious about the silence Sofia promised.",
      "choice1": "Walk to the Old Chapel"
    },
    "cs": {
      "text": "Železná poštovní schránka je chladná a vlhká ranní rosou. Uvnitř nenajde žádné účty ani reklamy, jen malý, ručně malovaný pohled od Sofie. Je na něm akvarel jediné hořící svíčky na pozadí soumračné modré oblohy, její plamen je vyveden hustou, texturovanou skvrnou žluté barvy.\n\n’Klíč od knihovny ve staré kapli je pod uvolněnou cihlou u těžkých dubových dveří,’ píše se ve vzkazu. ‘Je to nejtišší místo na světě a říkala jsem si, že bys dnes mohla potřebovat jeho ticho. Dej si čaj, co je na kamnech.’ Rukopis je elegantní a pohostinný, vítá ji do kruhu důvěry, kterou si ještě nezasloužila, ale za kterou je vděčná.\n\nElara se usměje a pocítí jemné pouto komunity, která jako by rozuměla jejím potřebám dříve, než je vůbec vysloví. Tento druh intuitivní laskavosti v jejím předchozím životě neexistoval, tam byla každá interakce obchodní záležitostí. Zastrčí pohlednici do kapsy a vydá se směrem k okraji vesnice, zvědavá na ticho, které Sofia slíbila.",
      "choice1": "Jít ke staré kapli"
    }
  },

  3016: {
    "image": "assets/images/chapel_door.jpg",
    "sfx": "chapel_door.mp3",
    "nextIndex1": 3025, 
    "nextIndex2": 3026, 
    "en": {
      "text": "The Old Chapel sits on a small rise, its stones furred with silver-green moss and sheltered by a circle of ancient cypress trees. Elara finds the loose brick exactly where Sofia said it would be. It slides out with a gritty scrape, revealing a small, hollow space carved into the foundation.\n\nBeneath it lies a heavy iron key, cold and grounding in her palm. The air here smells of wild rosemary and sun-baked stone, a scent that feels like a physical embrace. The chapel itself seems to be leaning back into the hillside, a permanent fixture of the landscape that has weathered centuries of storms.\n\nShe stands before the massive oak door, the key poised at the lock. The wood is dark and pitted with age, yet it feels incredibly solid. As she slides the key into the keyhole, she feels a strange sense of homecoming, as if the door has been waiting for this specific key to return to its lock.",
      "choice1": "Unlock the oak door",
      "choice2": "Listen to the wind"
    },
    "cs": {
      "text": "Stará kaple stojí na malém návrší, její kameny jsou obrostlé stříbřitě zeleným mechem a chráněné kruhem prastarých cypřišů. Elara najde uvolněnou cihlu přesně tam, kde Sofia říkala. Vysune se s drsným skřípěním a odhalí malý, dutý prostor vytesaný v základech.\n\nPod ní leží těžký železný klíč, který ji v dlani studí a příjemně uzemňuje. Vzduch zde voní po divokém rozmarýnu a sluncem vyhřátém kameni, což je vůně, která působí jako fyzické objetí. Samotná kaple jako by se opírala o úbočí kopce, je stálou součástí krajiny, která přestála staletí bouří.\n\nStojí před masivními dubovými dveřmi, klíč připravený v zámku. Dřevo je tmavé a poznamenané věkem, přesto působí neuvěřitelně pevně. Jak zasouvá klíč do zámku, cítí zvláštní pocit návratu domů, jako by dveře čekaly právě na tento konkrétní klíč.",
      "choice1": "Odemknout dveře",
      "choice2": "Naslouchat větru"
    }
  },

  3025: {
    "image": "assets/images/door_open.jpg",
    "sfx": "door_open.mp3",
    "nextIndex1": 3017,
    "en": {
      "text": "The lock turns with a heavy, musical 'clack' that echoes through the still morning air. As the door swings open on well-oiled hinges, a wave of cool, jasmine-scented air greets her from the shadows. The interior is dark at first, but as her eyes adjust, she sees the faint outlines of thousands of books lining the walls.\n\nIt feels like stepping into another dimension, one where time has no authority. The high ceilings are lost in shadow, and the only sound is the soft thud of the door closing behind her. The transition from the bright, chaotic world outside to this structured silence is almost dizzying.\n\nShe leaves the bright morning sun behind and crosses the threshold into the dim, hallowed silence of the library. Each footstep on the stone floor sounds like a heartbeat. She is alone, yet she feels surrounded by the voices of a thousand authors, all resting quietly on their shelves.",
      "choice1": "Step inside"
    },
    "cs": {
      "text": "Zámek se otočí s těžkým, hudebním cvaknutím, které se rozlehne tichým ranním vzduchem. Jak se dveře otevírají na dobře promazaných pantech, ze stínů ji uvítá vlna chladného vzduchu s vůní jasmínu. Interiér je zpočátku tmavý, ale jak si její oči přivzknou, vidí slabé obrysy tisíců knih lemujících stěny.\n\nPřipadá si, jako by vstupovala do jiné dimenze, kde čas nemá žádnou moc. Vysoké stropy se ztrácejí ve stínu a jediným zvukem je tiché zadunění dveří, které se za ní zavírají. Přechod z jasného, chaotického světa venku do tohoto strukturovaného ticha je téměř závratný.\n\nNechává za sebou jasné ranní slunce a překračuje práh do šerého, posvátného ticha knihovny. Každý krok na kamenné podlaze zní jako úder srdce. Je sama, přesto má pocit, že je obklopena hlasy tisíců autorů, kteří všichni tiše odpočívají ve svých policích.",
      "choice1": "Vstoupit dovnitř"
    }
  },

  3026: {
    "image": "assets/images/belfry_wind.jpg",
    "sfx": "belfry_wind.mp3",
    "nextIndex1": 3017,
    "en": {
      "text": "Before entering, she pauses and tilts her head. The wind whistles through the stone belfry above like a distant, hollow flute playing a melody only the mountains understand. It is a lonely but beautiful sound that seems to vibrate in the very marrow of her bones.\n\nFor a moment, she feels the mountain breathing in sync with her own lungs. It is a moment of profound connection to the earth, a reminder that she is a small but vital part of a much larger, living world. The vastness of the landscape suddenly feels intimate rather than intimidating.\n\nShe stands perfectly still, letting the mountain's breath wash over her. The frantic pace of her city life feels like a distant, absurd memory compared to this ancient rhythm. With a final, deep inhalation, she turns her attention back to the door, ready to see what the library holds.",
      "choice1": "Enter the library"
    },
    "cs": {
      "text": "Než vstoupí, zastaví se a nakloní hlavu. Vítr hvízdá kamennou zvonicí nad ní jako vzdálená, dutá flétna hrající melodii, které rozumí jen hory. Je to osamělý, ale krásný zvuk, který jako by jí vibroval v morku kostí.\n\nNa okamžik cítí, jak hora dýchá v synchronu s jejími vlastními plícemi. Je to okamžik hlubokého spojení se zemí, připomínka, že je malou, ale důležitou součástí mnohem většího, živého světa. Rozlehlost krajiny najednou působí spíše intimně než zastrašujícím způsobem.\n\nStojí naprosto nehybně a nechává dech hory, aby ji omýval. Zběsilé tempo jejího městského života jí připadá jako vzdálená, absurdní vzpomínka ve srovnání s tímto prastarým rytmem. S posledním hlubokým nádechem se znovu soustředí na dveře, připravena zjistit, co knihovna skrývá.",
      "choice1": "Vstoupit do knihovny"
    }
  },

  3017: {
    "image": "assets/images/library_interior.jpg",
    "nextIndex1": 3027, 
    "nextIndex2": 3028, 
    "en": {
      "text": "The room feels entirely outside of time. Floor-to-ceiling wooden shelves groan under the weight of vellum-bound books, and dust motes dance in thick, slanted beams of amber sunlight. A large, circular window at the far end of the hall provides a view of the sky, framing the clouds like a living painting.\n\nIn the corner, a small copper kettle on a cast-iron stove begins to hum, its soft whistle a domestic comfort in the grand silence. A stack of mismatched ceramic mugs sits on a nearby table, next to a tin of loose-leaf tea. The room is clearly maintained with love, a sanctuary for those who value the written word.\n\nElara looks around, overwhelmed by the sheer volume of stories waiting to be rediscovered. History, philosophy, botany, and poetry - the collective wisdom of the valley is gathered here. She realizes that she could spend a lifetime in this room and still only scratch the surface of its secrets.",
      "choice1": "Prepare the tea",
      "choice2": "Browse the shelves"
    },
    "cs": {
      "text": "Místnost působí jako zcela mimo čas. Dřevěné police od podlahy až ke stropu se prohýbají pod tíhou knih vázaných v pergamenu a v hustých, šikmých paprscích jantarového světla tančí prach. Velké kruhové okno na vzdáleném konci haly poskytuje výhled na oblohu a rámuje mraky jako živý obraz.\n\nV rohu začíná na litinových kamnech pobrukovat malá měděná konvice, jejíž tiché pískání je domáckou útěchou ve velkolepém tichu. Na nedalekém stole stojí sada nesourodých keramických hrnků vedle plechovky se sypaným čajem. Místnost je zjevně udržována s láskou, jako útočiště pro ty, kteří si váží psaného slova.\n\nElara se rozhlíží kolem, ohromena množstvím příběhů, které čekají na své znovuobjevení. Historie, filozofie, botanika a poezie - kolektivní moudrost údolí je shromážděna zde. Uvědomuje si, že by v této místnosti mohla strávit celý život a stále by jen klouzala po povrchu jejích tajemství.",
      "choice1": "Připravit čaj",
      "choice2": "Prohlížet si police"
    }
  },

  3027: {
    "image": "assets/images/tea_prep.jpg",
    "sfx": "tea_prep.mp3",
    "nextIndex1": 3018,
    "en": {
      "text": "She focuses on the ritual of the tea first. The scent of dried chamomile and wild mint fills the small room, weaving through the smell of old paper and beeswax like a fresh thread. She moves slowly, savoring the simple mechanics of lighting the stove and pouring the water.\n\nAs she waits for the water to steep, she feels her shoulders drop. The physical tension she has carried for years begins to uncoil, leaving her feeling vulnerable but peaceful. The steam from the mug rises in curls, mirroring the dance of the dust motes in the sunlight.\n\nThe simple act of preparing a drink in this ancient space makes her feel instantly anchored to the floor and the present moment. There is no urgency here, no ticking clock. She wraps her hands around the warm ceramic, letting the heat seep into her palms, and takes her first sip of the valley's hospitality.",
      "choice1": "Pick up a book"
    },
    "cs": {
      "text": "Nejdříve se soustředí na rituál přípravy čaje. Vůně sušeného heřmánku a divoké máty naplní místnost a prolíná se vůní starého papíru a včelího vosku jako čerstvá nit. Pohybuje se pomalu a vychutnává si jednoduchou mechaniku zapálení kamen a nalévání vody.\n\nZatímco čeká, až se čaj vylouhuje, cítí, jak jí klesají ramena. Fyzické napětí, které v sobě nosila roky, se začíná uvolňovat a zanechává v ní pocit zranitelnosti, ale zároveň klidu. Pára z hrnku stoupá v kadeřích a zrcadlí tanec prachových částic ve slunečním světle.\n\nProstý úkon přípravy nápoje v tomto starobylém prostoru způsobuje, že se okamžitě cítí uzemněná a spojená s přítomným okamžikem. Není zde žádný spěch, žádné tikající hodiny. Obemkne rukama teplou keramiku, nechá teplo pronikat do dlaní a vypije svůj první doušek pohostinnosti údolí.",
      "choice1": "Vzít si knihu"
    }
  },

  3028: {
    "image": "assets/images/dusty_shelves.jpg",
    "nextIndex1": 3018,
    "en": {
      "text": "She runs her fingers over the weathered leather spines, feeling the variations in texture. Some are rough and dry, while others are soft as velvet from centuries of handling. She reads the titles in various languages - some she knows, others that look like ancient runes or local dialects.\n\nOne particular book, small and bound in dark indigo leather, seems to pull at her hand. It is tucked between two massive ledgers, looking humble yet significant. As she touches it, she notices a small gold leaf design on the spine - a single, stylized star.\n\nShe can almost feel a faint warmth radiating from its cover, an invitation to uncover the knowledge hidden within. Her curiosity, which had been buried under years of corporate logic, flares up with new intensity. She holds her breath and gently slides the book from its resting place.",
      "choice1": "Pull it from the shelf"
    },
    "cs": {
      "text": "Přejíždí prsty po zvětralých kožených hřbetech a vnímá rozdíly v jejich textuře. Některé jsou drsné a suché, jiné jemné jako samet díky staletím používání. Čte názvy v různých jazycích - některé zná, jiné vypadají jako starobylé runy nebo místní dialekty.\n\nJedna konkrétní kniha, malá a vázaná v tmavě indigové kůži, jako by ji přitahovala za ruku. Je zastrčená mezi dvěma masivními účetními knihami a vypadá skromně, ale významně. Jak se jí dotkne, všimne si malého vzoru z plátkového zlata na hřbetu - jediné stylizované hvězdy.\n\nSkoro cítí slabé teplo sálající z jejích desek, pozvání k odhalení vědomostí ukrytých uvnitř. Její zvědavost, která byla pohřbena pod roky firemní logiky, vzplane s novou intenzitou. Zatají dech a jemně vysune knihu z jejího odpočinkového místa.",
      "choice1": "Vytáhnout ji z police"
    }
  },

  3018: {
    "image": "assets/images/bella_notes.jpg",
    "sfx": "bella_notes.mp3",
    "nextIndex1": 3029, 
    "nextIndex2": 3030, 
    "en": {
      "text": "The volume she chose is an old guide to the local flora. As she flips through the pages, a perfectly pressed Midnight Blue petal falls onto her lap, its color still vibrant despite the years. It is thin and translucent, looking like a shard of fallen sky resting against her jeans.\n\nIn the margins, she recognizes Bella’s handwriting, energetic and looping: 'The color of peace is deeper than we think, and it grows best in the shadows of the heart.' The ink is slightly faded, but the message remains sharp and urgent. It is a direct link to her aunt's philosophy.\n\nElara feels a chill of recognition - a message across time. She realizes that Bella didn't just study these flowers. She lived by their example. The book isn't just a scientific record. It is a journal of a soul finding its way home through the medium of nature.",
      "choice1": "Read the legends",
      "choice2": "Find a map"
    },
    "cs": {
      "text": "Svazek, který si vybrala, je starý průvodce místní flórou. Jak listuje stránkami, do klína jí vypadne dokonale vylisovaný lístek Půlnoční modři, jehož barva je i po letech stále zářivá. Je tenký a průsvitný a vypadá jako střep spadlého nebe ležící na její sukni.\n\nNa okrajích poznává Bellino písmo, energické a zaoblené: ‘Barva klidu je hlubší, než si myslíme, a nejlépe roste ve stínech srdce.’ Inkoust je mírně vybledlý, ale vzkaz zůstává jasný a naléhavý. Je to přímé spojení s filozofií její tety.\n\nElara pocítí mrazení z rozpoznání - vzkaz napříč časem. Uvědomuje si, že Bella tyto květiny jen nestudovala. Žila podle jejich vzoru. Kniha není jen vědeckým záznamem, je to deník duše, která nachází cestu domů skrze přírodu.",
      "choice1": "Číst legendy",
      "choice2": "Najít mapu"
    }
  },

  3029: {
    "image": "assets/images/legends_page.jpg",
    "sfx": "legends_page.mp3",
    "nextIndex1": 3019,
    "en": {
      "text": "The book tells legends of a time when the stars fell into the valley during a great storm and became seeds for flowers that glowed in the dark. The prose is poetic, blending myth with botany in a way that feels entirely plausible in this magical landscape. She finds herself leaning closer to the page, captivated by the lore.\n\nBella had circled one particular passage with a bold, ink stroke. 'They only grow for those who have stopped running,' the text stated. It was a warning and a promise all at once, suggesting that the beauty of the valley was a reward for those who achieved internal quiet.\n\nBella added a note below: 'I finally stopped today. The gold is everywhere.' Elara looks up from the book, glancing at the amber light hitting the floor. She begins to understand that the 'gold' her aunt spoke of wasn't metal, but a quality of light and a state of being.",
      "choice1": "Continue reading"
    },
    "cs": {
      "text": "Kniha vypráví legendy o době, kdy během velké bouře spadly do údolí hvězdy a staly se semínky květin, které zářily ve tmě. Text je poetický, mísí mýty s botanikou způsobem, který v této magické krajině působí zcela uvěřitelně. Přistihne se, jak se naklání blíž ke stránce, uchvácena těmito příběhy.\n\nBella zakroužkovala jednu konkrétní pasáž výrazným tahem inkoustu. ‘Rostou jen pro ty, kteří přestali utíkat,’ stálo v textu. Bylo to varování i slib zároveň, naznačující, že krása údolí je odměnou pro ty, kteří dosáhnou vnitřního klidu.\n\nBella pod to připsala poznámku: ‘Dnes jsem se konečně zastavila. Ta záře je všude.’ Elara vzhlédne od knihy a pohlédne na jantarové světlo dopadající na podlahu. Začíná chápat, že ta ‘záře’, o které její teta mluvila, nebyla kov, ale kvalita světla a stav bytí.",
      "choice1": "Pokračovat ve čtení"
    }
  },

  3030: {
    "image": "assets/images/secret_map.jpg",
    "nextIndex1": 3019,
    "en": {
      "text": "Tucked into the very back of the binding is a loose sketch of the cottage garden. It’s a detailed blueprint of the land Elara now calls home, but it’s marked with symbols she doesn't yet understand. There are small spirals near the stream and triangles near the old stone wall, all drawn with meticulous care.\n\nA heavy circle is drawn around the ancient stone bench beneath the cypress tree, with a single word written in the center: 'Listen.' The word is underlined three times, its importance underscored by the pressure of the pen on the paper. It is a clear instruction left for whoever would find this map.\n\nShe studies the garden map with a furrowed brow, trying to memorize the locations of the symbols. It feels like a key to a lock she didn't know existed. She carefully tucks the sketch back into the book, feeling like she has just been given the first piece of a very important puzzle.",
      "choice1": "Continue reading"
    },
    "cs": {
      "text": "Zcela vzadu ve vazbě je zastrčený volný náčrtek zahrady u domu. Je to detailní plán pozemku, který Elara nyní nazývá domovem, ale je označen symboly, kterým zatím nerozumí. U potoka jsou malé spirály a u staré kamenné zdi trojúhelníky, vše nakresleno s pečlivostí.\n\nKolem staré kamenné lavičky pod cypřišem je nakreslen silný kruh a uprostřed je napsáno jediné slovo: ‘Naslouchej.’ Slovo je třikrát podtržené, jeho důležitost zdůrazňuje tlak pera na papír. Je to jasný pokyn zanechaný pro kohokoli, kdo tuto mapu najde.\n\nSe svraštělým obočím studuje mapu zahrady a snaží se zapamatovat si umístění symbolů. Působí to jako klíč k zámku, o jehož existenci nevěděla. Opatrně zastrčí náčrtek zpět do knihy a cítí se, jako by právě dostala první kousek velmi důležité skládačky.",
      "choice1": "Pokračovat ve čtení"
    }
  },

  3019: {
    "image": "assets/images/library_window.jpg",
    "nextIndex1": 3031, 
    "nextIndex2": 3032, 
    "en": {
      "text": "Bella’s writings suggest that the 'Aura of Gold' is not a physical treasure, but a frequency of being that one finds only in absolute stillness. It is the moment when the internal noise finally fades to zero, allowing the music of the world to become audible. It is a concept that challenges everything Elara knows about success.\n\nSitting in the quiet library, Elara feels the 'grey' internal static of her city life - the deadlines, the emails, the constant rush - finally dissolving into the amber light of the room. The frantic pace that once defined her now seems like a fever dream from which she has finally woken. She feels a lightness in her chest that she hasn't felt since childhood.\n\nShe realizes that the library is a training ground for this stillness. The books are silent teachers, showing her how to exist without performing. She closes her eyes for a moment, letting the silence of the vellum and stone settle into her bones, accepting the invitation to simply be.",
      "choice1": "Curl up in the armchair",
      "choice2": "Open the window"
    },
    "cs": {
      "text": "Belliny zápisky naznačují, že ‘Zlatá záře’ není fyzický poklad, ale frekvence bytí, kterou člověk najde pouze v absolutním klidu. Je to okamžik, kdy vnitřní hluk konečně pomine a umožní slyšet hudbu světa. Je to koncept, který zpochybňuje vše, co Elara ví o úspěchu.\n\nZatímco Elara sedí v tiché knihovně, cítí, jak se ‘šedý’ vnitřní šum jejího městského života - termíny, e-maily, neustálý spěch - konečně rozpouští v jantarovém světle místnosti. Zběsilé tempo, které ji kdysi definovalo, se nyní zdá jako horečnatý sen, ze kterého se konečně probudila. Cítí v hrudi lehkost, kterou nezažila od dětství.\n\nUvědomuje si, že knihovna je výcvikovým prostorem pro tento klid. Knihy jsou tichými učiteli, kteří jí ukazují, jak existovat, aniž by musela podávat výkon. Na okamžik zavře oči, nechá ticho pergamenu a kamene proniknout do svých kostí a přijímá pozvání k tomu, aby prostě jen byla.",
      "choice1": "Uvelebit se v křesle",
      "choice2": "Otevřít okno"
    }
  },

  3031: {
    "image": "assets/images/velvet_chair.jpg",
    "sfx": "velvet_chair.mp3",
    "nextIndex1": 3022,
    "en": {
      "text": "The velvet chair is soft and smells of old linen and sun-warmed wood. She sinks into its embrace, letting the history of the room wrap around her like a heavy blanket. The springs creak slightly as they take her weight, a small, welcoming sound in the vast quiet of the library.\n\nShe realizes that she doesn't need to do anything right now. The valley is providing everything she needs, and for the first time in years, 'doing nothing' doesn't feel like a waste of time. It feels like an essential act of recovery, a necessary shedding of her former self.\n\nShe watches the way the light shifts across the rows of books, noting how the colors change as the sun moves behind the cypress trees. There is a deep, resonant peace in this observation. She is no longer a consumer of moments. She is a participant in the slow, deliberate unfolding of time.",
      "choice1": "Time to head back"
    },
    "cs": {
      "text": "Sametové křeslo je měkké a voní starým lnem a sluncem vyhřátým dřevem. Ponoří se do jeho objetí a nechá historii místnosti, aby se kolem ní ovinula jako těžká deka. Pružiny při jejím dosednutí mírně zavržou, což je malý, vítající zvuk v obrovském tichu knihovny.\n\nUvědomuje si, že právě teď nemusí dělat vůbec nic. Údolí jí poskytuje vše, co potřebuje, a poprvé po letech jí ‘nicnedělání’ nepřipadá jako ztráta času. Působí to jako nezbytný akt regenerace, nutné odhození jejího dřívějšího já.\n\nSleduje, jak se světlo posouvá po řadách knih, a všímá si, jak se barvy mění, když slunce zajde za cypřiše. V tomto pozorování je hluboký, rezonující klid. Už není spotřebitelem okamžiků. Je účastníkem pomalého, záměrného odvíjení času.",
      "choice1": "Je čas se vrátit"
    }
  },

  3032: {
    "image": "assets/images/open_window.jpg",
    "sfx": "open_window.mp3",
    "nextIndex1": 3022,
    "en": {
      "text": "She pushes open the small leaded window. The valley air rushes in, cool and sharp, carrying the scent of wild herbs and damp earth. It contrasts beautifully with the warm, stagnant air of the library, acting as a refreshing wake-up call to her senses.\n\nThe world outside looks brighter and more focused after her time in the shadows. The greens of the trees seem more intense, and the blue of the sky more profound. It is as if the library has recalibrated her vision, stripping away the dullness of her previous exhaustion.\n\nShe feels a renewed sense of clarity, as if the silence of the books has sharpened her senses for the life waiting for her outside. She leans her head against the cool stone frame, looking out at the path that leads back home. She is ready to return, but she is carrying a piece of this sanctuary with her.",
      "choice1": "It's time to go"
    },
    "cs": {
      "text": "Otevře malé okno. Vzduch z údolí vtrhne dovnitř, chladný a ostrý, nese vůni divokých bylin a vlhké země. Krásně kontrastuje s teplým, nehybným vzduchem v knihovně a působí jako osvěžující budíček pro její smysly.\n\nSvět venku vypadá po čase stráveném ve stínech jasněji a soustředěněji. Zeleň stromů se zdá intenzivnější a modř oblohy hlubší. Je to, jako by knihovna překalibrovala její vidění a zbavila ji otupělosti z dřívějšího vyčerpání.\n\nCítí obnovený pocit jasnosti, jako by ticho knih naostřilo její smysly pro život, který na ni čeká venku. Opře si hlavu o chladný kamenný rám a hledí na cestu, která vede zpět domů. Je připravena se vrátit, ale kousek tohoto útočiště si nese s sebou.",
      "choice1": "Je čas jít"
    }
  },

  3022: {
    "image": "assets/images/leaving_chapel.jpg",
    "sfx": "leaving_chapel.mp3",
    "nextIndex1": 3023,
    "en": {
      "text": "As the shadows of the cypress trees grow longer, Elara carefully replaces the iron key under the loose brick. The weight of the morning’s discoveries feels light in her spirit, a pleasant burden of wisdom that doesn't drag her down. She pats the brick back into place, ensuring the secret remains safe for the next seeker.\n\nThe world outside the chapel feels different now - more vivid, more intentional. The rustle of the leaves sounds like a conversation, and the shifting light on the hills looks like a slow-motion dance. Every detail of her surroundings seems to be imbued with a hidden meaning she is finally starting to decode.\n\nIt is as if her eyes have been cleaned by the silence of the room, allowing her to see the magic in the ordinary details of the path. She walks with a slow, deliberate pace, not wanting to disturb the tranquility she has cultivated. As she rounds a bend in the path, the cottage comes into view, and she sees a figure working by the nearby wall.",
      "choice1": "Walk back home"
    },
    "cs": {
      "text": "Jak se stíny cypřišů prodlužují, Elara pečlivě vrací železný klíč pod uvolněnou cihlu. Váha ranních objevů se v její duši zdá lehká, je to příjemné břemeno moudrosti, které ji netáhne k zemi. Poklepe na cihlu, aby se ujistila, že tajemství zůstane v bezpečí pro dalšího hledajícího.\n\nSvět venku před kaplí teď působí jinak - živěji, záměrněji. Šustění listí zní jako rozhovor a měnící se světlo na kopcích vypadá jako zpomalený tanec. Každý detail jejího okolí se zdá být prostoupen skrytým významem, který konečně začíná dešifrovat.\n\nJe to, jako by jí ticho místnosti pročistilo zrak a umožnilo jí vidět kouzlo v běžných detailech cesty. Kráčí pomalým, rozvážným krokem a nechce rušit klid, který v sobě vypěstovala. Když zahne za zatáčku, objeví se chalupa a ona u blízké zdi spatří pracující postavu.",
      "choice1": "Jít zpět domů"
    }
  },

  // ==========================================
  // --- CONVERGENCE POINT ---
  // ==========================================

  3023: {
    "image": "assets/images/neighbor_nod.jpg",
    "nextIndex1": 3024, 
    "en": {
      "text": "On her walk back, she passes an elderly man tending to a stone wall. He doesn't stop his work, but he offers a silent, knowing nod as she passes. His hands are stained with the dust of the valley, and his face is a map of a life spent in the sun.\n\nIt is a gesture of shared understanding that needs no words. In this valley, silence isn't a lack of communication - it is the highest form of it. It is a recognition of the other's journey without the need to intrude or explain. Elara feels a deep sense of belonging in that simple nod.\n\nElara returns the nod, feeling for the first time that she is part of the rhythm of this place. She isn't an outsider looking in anymore. She is a thread in the tapestry. She continues her walk with a smile, the elderly man's silent greeting acting as a final blessing on her morning's journey.",
      "choice1": "Reach the stone bench"
    },
    "cs": {
      "text": "Při zpáteční cestě míjí staršího muže, který opravuje kamennou zeď. Nepřeruší práci, ale když Elara prochází kolem, věnuje jí tiché, spiklenecké kývnutí. Jeho ruce jsou ušpiněné prachem údolí a jeho tvář je mapou života stráveného na slunci.\n\nJe to gesto sdíleného porozumění, které nepotřebuje slova. V tomto údolí ticho neznamená nedostatek komunikace - je to její nejvyšší forma. Je to uznání cesty toho druhého, aniž by bylo nutné do ní zasahovat nebo ji vysvětlovat. Elara v tom prostém kývnutí cítí hluboký pocit sounáležitosti.\n\nElara kývnutí opětuje a poprvé cítí, že je součástí rytmu tohoto místa. Už není cizincem, který se dívá zvenčí. Je nití v tapisérii. Pokračuje v cestě s úsměvem, přičemž tichý pozdrav starého muže působí jako závěrečné požehnání její ranní cestě.",
      "choice1": "Dojít k lavičce"
    }
  },

  3024: {
    "image": "assets/images/sunset_bench.jpg",
    "nextIndex1": 4000, 
    "en": {
      "text": "Elara sits on the ancient stone bench as the sky erupts in a final, defiant display of orange, gold, and violet. The 'Aura of Gold' is at its peak, washing the valley in a light that feels like a blessing. The air is still, and the only sound is the distant, rhythmic chirping of the evening's first crickets.\n\nAs the sun dips below the ridge, the light fades into the deep, shimmering 'Midnight Blue' of the evening. She realizes that she isn't just watching the change. She is part of it. The bench beneath her feels like a throne, and the valley, her home. The transition from day to night is no longer a marker of time lost, but of beauty found.\n\nShe watches the first star prick through the velvet sky, and for the first time in her life, she isn't afraid of what the darkness might bring. The shadows are no longer places for monsters, but for rest and the quiet growth of the Midnight Blue. She closes her eyes, breathing in the scent of the cooling earth, perfectly at peace.",
      "choice1": "End of The Story"
    },
    "cs": {
      "text": "Elara sedí na staré kamenné lavičce, zatímco nebe plane v posledním, vzdorném představení oranžové, zlaté a fialové. ‘Zlatá záře’ vrcholí a zaplavuje údolí světlem, které působí jako požehnání. Vzduch se ani nepohne a jediným zvukem je vzdálené, rytmické cvrlikání prvních večerních cvrčků.\n\nJakmile slunce klesne pod hřeben, světlo přejde do hluboké, třpytivé ‘Půlnoční modři’ večera. Uvědomuje si, že tu změnu jen nepozoruje. Je její součástí. Lavička pod ní působí jako trůn a údolí jako její domov. Přechod ze dne do noci už není ukazatelem ztraceného času, ale nalezené krásy.\n\nSleduje, jak na sametovém nebi probleskne první hvězda, a poprvé v životě se nebojí toho, co by mohla přinést tma. Stíny už nejsou místem pro nestvůry, ale pro odpočinek a tichý růst Půlnoční modři. Zavře oči, vdechuje vůni chladnoucí země a cítí se v naprostém klidu.",
      "choice1": "Konec příběhu"
    }
  }
};