import 'package:hive/hive.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  late String possibleCauses;

  @HiveField(2)
  late String possibleSolution;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late DateTime dateTime;

  Disease({required this.name, required this.imagePath}) {
    dateTime = DateTime.now();

    switch (name.toLowerCase().trim()) {
      case "Apple___Apple_scab":
        possibleCauses =
            "Venturia inaequalis spores overwinter in fallen leaves. In spring, rain splashes spores onto new leaves and fruit, especially in cool, wet weather.";
        possibleSolution =
            "Rake and destroy fallen leaves in autumn to reduce overwintering spores. Apply protective fungicides (e.g., mancozeb or captan) during green tip to first cover sprays. Prune canopy to improve air circulation and reduce leaf wetness.";
        break;
      case "Apple___Black_rot":
        possibleCauses =
            "Botryosphaeria obtusa infects through wounds or natural openings. Warm wet spring conditions favor lesion development on fruit, leaves, and twigs.";
        possibleSolution =
            "Prune out and destroy cankered branches and mummified fruit. Apply pre-harvest fungicides (e.g., myclobutanil) in late spring. Maintain tree vigor with balanced pollination and nutrition.";
        break;
      case "Apple___Cedar_apple_rust":
        possibleCauses =
            "Gymnosporangium juniperi-virginianae alternates between cedar (juniper) and apple. Orange spots develop where nearby cedar hosts are present.";
        possibleSolution =
            "Plant rust-resistant cultivars (e.g., 'Liberty'). Remove nearby juniper if feasible. Spray fungicides (e.g., trifloxystrobin) at pink bud and petal fall. Cleanup fallen infected leaves.";
        break;
      case "Apple___healthy":
        possibleCauses = "No disease symptoms detected; tree is healthy.";
        possibleSolution = "Continue regular orchard management and sanitation.";
        break;

      case "Blueberry___healthy":
        possibleCauses = "No visible disease or stress; plant shows normal growth and vigor.";
        possibleSolution = "Maintain soil acidity (pH 4.5–5.5), proper irrigation, and mulching.";
        break;

      case "Cherry_(including_sour)___Powdery_mildew":
        possibleCauses =
            "Podosphaera clandestina grows in warm (20–27 °C), humid environments. It forms white, powdery fungal growth on leaves, shoots, and fruit.";
        possibleSolution =
            "Spray sulfur or potassium bicarbonate when 1–2 cm buds appear, repeating every 7–10 days. Prune to thin canopy and increase air flow.";
        break;
      case "Cherry_(including_sour)___healthy":
        possibleCauses = "No signs of infection or nutrient deficiency.";
        possibleSolution = "Maintain balanced fertilization and disease monitoring.";
        break;

      case "Corn_(maize)___Cercospora_leaf_spot Gray_leaf_spot":
        possibleCauses = "Cercospora zeae-maydis spores thrive in warm (25–30 °C), humid conditions and infect through leaf wounds.";
        possibleSolution =
            "Use resistant hybrids. Rotate with non-host crops. Begin foliar fungicide at VT–R1 stages. Remove crop debris post-harvest.";
        break;
      case "Corn_(maize)___Common_rust_":
        possibleCauses = "Puccinia sorghi spreads by windborne urediniospores; pustules form in moderate, moist conditions.";
        possibleSolution = "Plant resistant hybrids. For severe outbreaks, apply fungicide (e.g., propiconazole) during silking.";
        break;
      case "Corn_(maize)___Northern_Leaf_Blight":
        possibleCauses =
            "Exserohilum turcicum infects extended wet periods with cool nights (15–20 °C). Characteristic cigar-shaped lesions develop.";
        possibleSolution = "Plant tolerant hybrids. Use crop rotation. Spray fungicide during early lesion appearance.";
        break;
      case "Corn_(maize)___healthy":
        possibleCauses = "No observable disease or nutrient stress.";
        possibleSolution = "Maintain integrated pest management practices.";
        break;

      case "Grape___Black_rot":
        possibleCauses = "Guignardia bidwellii spores infect all green tissues; spread favoured by persistent rain and high humidity.";
        possibleSolution = "Remove mummified fruit and prune for air flow. Apply captan or mancozeb at early shoot stages and around bloom.";
        break;
      case "Grape___Esca_(Black_Measles)":
        possibleCauses =
            "Complex of fungi (Phaeomoniella, Phaeoacremonium) entering through pruning wounds, causing foliar 'measles' spots and wood decay.";
        possibleSolution =
            "Avoid pruning in rainy weather. Disinfect tools. Remove severely infected vines. Consider trunk treatments with preventative fungicides.";
        break;
      case "Grape___Leaf_blight_(Isariopsis_Leaf_Spot)":
        possibleCauses = "Pseudocercospora vitis spores spread in warm, humid weather; causes small brown spots that coalesce.";
        possibleSolution = "Apply copper or strobilurin fungicides. Prune to thin canopy. Remove fallen leaves.";
        break;
      case "Grape___healthy":
        possibleCauses = "No visible disease; canopy and fruit are healthy.";
        possibleSolution = "Continue pruning, disease scouting, and appropriate fungicide timing.";
        break;

      case "Orange___Haunglongbing_(Citrus_greening)":
        possibleCauses =
            "Candidatus Liberibacter spp. bacteria spread by Asian citrus psyllid. Causes blotchy mottling, yellow shoots, twig dieback.";
        possibleSolution =
            "There’s no cure. Remove infected trees promptly. Control psyllid vectors with insecticides and psyllid-free nursery stock.";
        break;

      case "Peach___Bacterial_spot":
        possibleCauses = "Xanthomonas campestris pv. pruni is spread by splashing rain and wind; causes small, angular lesions on leaves and fruit.";
        possibleSolution = "Use tolerant varieties. Apply copper-based sprays from shuck split through early summer. Prune for canopy ventilation.";
        break;
      case "Peach___healthy":
        possibleCauses = "No bacterial or fungal symptoms present.";
        possibleSolution = "Maintain scheduled irrigation, nutrition, and foliar protection.";
        break;

      case "Pepper,_bell___Bacterial_spot":
        possibleCauses = "Xanthomonas euvesicatoria infects via rain/wind and contaminated tools/seeds; causes dark lesions on leaves and fruits.";
        possibleSolution = "Use disease-free seed and transplants. Apply copper + mancozeb sprays after blooms. Avoid overhead irrigation.";
        break;
      case "Pepper,_bell___healthy":
        possibleCauses = "Bell peppers show no signs of stress or infection.";
        possibleSolution = "Continue standard cultivation and disease scouting.";
        break;

      case "Potato___Early_blight":
        possibleCauses = "Alternaria solani spores infect via splash in warm (20–28 °C), humid conditions; causes concentric lesions.";
        possibleSolution =
            "Apply protectant fungicides (e.g., chlorothalonil) at first sign of symptoms and repeat every 7–10 days. Ensure plant spacing and mulch.";
        break;
      case "potato late blight":
        possibleCauses = "Phytophthora infestans thrives in cool (10–20 °C), wet conditions; rapidly destroys foliage and tubers.";
        possibleSolution =
            "Apply systemic fungicides (e.g., metalaxyl) at first rain. Remove and destroy infected foliage. Avoid overhead irrigation.";
        break;
      case "Potato___healthy":
        possibleCauses = "No blight, scab, or other common potato diseases observed.";
        possibleSolution = "Monitor crop and maintain optimal soil moisture and fertility.";
        break;

      case "Raspberry___healthy":
        possibleCauses = "Plants are free of cane blight, rust, or mildew.";
        possibleSolution = "Use cane thinning, balanced nutrition, and routine sanitizing.";
        break;

      case "Soybean___healthy":
        possibleCauses = "Plants exhibit good pod set and foliage health; no signs of fungal or bacterial issues.";
        possibleSolution = "Rotate crops and scout regularly for pests like aphids or rust.";
        break;

      case "Squash___Powdery_mildew":
        possibleCauses = "Several fungal species (Erysiphe spp.) germinate in warm (20–27 °C), high humidity, especially late season.";
        possibleSolution = "Apply sulfur or potassium bicarbonate weekly when dew persists. Choose resistant varieties and space plants well.";
        break;

      case "Strawberry___Leaf_scorch":
        possibleCauses = "Diplocarpon earliana spores infect during cool (18–22 °C), damp weather; lesions lead to leaf scorching.";
        possibleSolution = "Remove affected leaves and destroy them. Apply captan or thiophanate-methyl post-harvest. Improve air circulation.";
        break;
      case "Strawberry___healthy":
        possibleCauses = "Plants show no leaf spots, wilting, nor fruit rot.";
        possibleSolution = "Maintain drip irrigation, proper mulching, and routine field sanitation.";
        break;

      case "Tomato___Bacterial_spot":
        possibleCauses = "Xanthomonas spp. enters via splashing rain, wind, or contaminated tools; produces water-soaked spots.";
        possibleSolution = "Remove and destroy diseased plants. Spray copper-based bactericides, sterilize tools, and avoid overhead irrigation.";
        break;
      case "Tomato___Early_blight":
        possibleCauses = "Alternaria solani infects older foliage during warm (21–27 °C), wet periods; lesions expand in concentric rings.";
        possibleSolution = "Apply chlorothalonil or copper fungicides at first sign. Mulch to reduce soil splash and space plants.";
        break;
      // case "Tomato___Late_blight":
      //   possibleCauses = "Phytophthora infestans airborne spores infect foliage and fruit in cool (13–20 °C), moist weather.";
      //   possibleSolution = "Apply systemic fungicides nightly during wet periods. Remove and incinerate infected plants.";
      //   break;
      case "Tomato___Leaf_Mold":
        possibleCauses = "Cladosporium fulvum flourishes in humid greenhouse conditions; yellow patches appear on leaves.";
        possibleSolution = "Increase ventilation, use resistant cultivars, and apply copper or chlorothalonil sprays.";
        break;
      case "Tomato___Septoria_leaf_spot":
        possibleCauses = "Septoria lycopersici spores survive in debris; wet weather promotes new infections.";
        possibleSolution = "Remove lower leaves. Apply sprayers of mancozeb. Use disease-resistant varieties.";
        break;
      case "Tomato___Spider_mites Two-spotted_spider_mite":
        possibleCauses = "Tetranychus urticae thrive in hot (>30 °C), dry conditions; webs and stippling appear on leaves.";
        possibleSolution = "Spray with miticides or insecticidal soap. Keep humidity up and remove severely infested foliage.";
        break;
      case "Tomato___Target_Spot":
        possibleCauses = "Corynespora cassiicola infects during warm, wet periods; targets circular lesions on foliage.";
        possibleSolution = "Apply strobilurin fungicides. Remove plant debris and reduce leaf wetness.";
        break;
      case "Tomato___Tomato_Yellow_Leaf_Curl_Virus":
        possibleCauses = "Tomato yellow leaf curl virus spreads via whiteflies and causes curling, yellowing, and stunting.";
        possibleSolution = "Control whitefly populations. Remove infected plants and use reflective mulch.";
        break;
      case "Tomato___Tomato_mosaic_virus":
        possibleCauses = "Tobamovirus transmitted mechanically (tools, hands, infected transplants); stunts plants with mottled leaves.";
        possibleSolution = "Discard infected plants. Sterilize tools and wash hands often. Use resistant cultivars.";
        break;
      case "Tomato___healthy":
        possibleCauses = "Plants show ideal foliage, blossoms, and no disease symptoms.";
        possibleSolution = "Maintain pruning, water management, and disease scouting.";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }
}
