

protocol Descripcion {
    func obtenerDescripcion ()
    
}
//typealias IDUser = Int
struct User {
    let id : String
    let name : String
    
}

struct Address: Descripcion {
    let ruta : String
    let km : String

   func obtenerDescripcion() {
        print ("Direccion: \(ruta), \(km)")
    }
}

struct Place: Descripcion{ //destinosTuristicos
    let city : String
    let country : String
    let landmarks: Landmark
    
    func obtenerDescripcion() {
        print("Destinos : \(city), \(country)")
    }
}

struct Landmark {
    var attraction : [String]
    var activities : [String]
    
    func obtenerDescpricion (){
        print ("Landmark \(attraction), \(activities)")
    }
}

class PlacesList: Descripcion {
    let places: [Place]
    let landmarks: [Landmark]
    let direcciones: [Address]
    
    init(places: [Place], landmarks: [Landmark], direcciones: [Address]) {
        self.places = places
        self.landmarks = landmarks
        self.direcciones = direcciones
    }
    func obtenerDescripcion() {
        print("Destinos:")
            print("\(places), \(landmarks), \(direcciones)")
    }
}

struct FavoritePlaces: Descripcion{
    let user: User
    var places: [Place]
    
    func  obtenerDescripcion() {
        print("Destinos Favoritos:")
        print("\(places)\n")
    }
    
    mutating func addFAvorite (cityF: String, countryF: String, landmarkF: Landmark) {
        places.append(Place(city:cityF, country: countryF, landmarks: landmarkF))
    }
    
}


var places = [Place(city: "Misiones",
                    country: "Argentina",
                    landmarks: Landmark(attraction: ["Cataratas del Iguazu", "Ruinas e San Ignacio","Posadas"],
                                        activities: ["Deportes de extremo", "Safaris Fotograficos", "Paseos en Lancha"])),
              Place(city: "Corrientes",
                    country: "Argentina",
                    landmarks: Landmark(attraction: ["Esteros del Ibera", "Yapeyu"],
                                         activities: ["Paseo en Lancha", "Cabalgatas Nocturnas"])),
              Place( city: "Cordoba",
                     country: "Argentina",
                     landmarks: Landmark(attraction: ["Parque Sarmiento", "Cerro Colorado"],
                                         activities: ["Paseo en Lancha", "Cabalgatas Nocturnas", "Safaris Fotograficos"]))]

var favoriteList = FavoritePlaces(
            user: User(id: "123",
                       name: "Araceli"),
            places: [Place(city: "Iguazu",
                           country: "Argentina",
                           landmarks:Landmark(attraction: ["Parque Sarmiento", "Cerro Colorado"],
                                              activities: ["Paseo en Lancha", "Cabalgatas Nocturnas", "Safaris Fotograficos"]))])

/****/

print("Destinos:")
print(places)

print("Seleccionar Destinos Favoritos: ")
favoriteList.addFAvorite(cityF: "Cordoba", countryF: "Argentina", landmarkF: Landmark(attraction: ["Parque Sarmiento", "Cerro Colorado"], activities: ["Paseo en Lancha", "Cabalgatas Nocturnas", "Safaris Fotograficos"]))

print("Listado de Destinos Favoritos:")
print(favoriteList.user)
favoriteList.obtenerDescripcion()