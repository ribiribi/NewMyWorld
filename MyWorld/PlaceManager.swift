//
//  PlaceManager.swift
//  MyWorld
//
//  Created by user143594 on 11/12/18.
//  Copyright © 2018 user143594. All rights reserved.
//

import Foundation
import MapKit


class PlaceManager {

    static let shared = PlaceManager()
    var places = [Place]()
    
    private init() {}
    
    
    //MARK: --------------------------------------- Class functions
    func append(_ place: Place) {
        places.append(place)
    }
    
    
    func count() -> Int {
        return places.count
    }
    
    
    func itemAt(position: Int) -> Place? {
        
        guard position < places.count else { return nil }
        
        return places[position]
    }
    
    
    func itemWithId(_ id: String) -> Place? {
        return places.filter {$0.id == id}.first
    }
    
    
    func remove(_ place: Place) {
        places = places.filter {$0.id != place.id}
    }

    
    func removeFromPosition(_ indexPath: Int){
        places.remove(at: indexPath)
    }

    
    //*
    func sortPlaces (whattButton: String) {
            
        for plac in places {
             
            if plac.iconTable == whattButton {
   
                remove(plac)
                places.insert(plac, at: 0)
            }
        }
    }
    
    
    //*
    func filteredByIcon(position: Int, whattButton: String) -> Bool {

        if places[position].iconTable == whattButton {

            return true
        }
       
        return false
    }

    
    //MARK: ---------------------------------------  Access to files and codification
    func jsonFrom(places: [Place]) -> Data?{
        
        var jsonData: Data? = nil
        let jsonEnconder = JSONEncoder()
        
        do{
            jsonData = try jsonEnconder.encode(places)
            
        } catch {
            return nil
        }
        
        return jsonData
    }
    
    
    func placesFrom (jsonData: Data) -> [Place]{
        
        let jsonDecoder = JSONDecoder()
        let places: [Place]
        
        do{
            places = try jsonDecoder.decode([Place].self, from: jsonData)
            
        } catch{
            return []
        }
        
        return places
    }

    
    func saveJsonToFile(origin: [Place]){
        
        let manager = PlaceManager.shared
        
        if let jsonData = manager.jsonFrom(places: origin){
            let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let filePath = docsPath.appendingPathComponent("places.json")
            
            do{
                try jsonData.write(to: filePath)
                print ("Fitxers guardats en local")
                
            } catch {
                print ("Error al escriure fitxer local")
            }
        }
    }
    
    //MARK: ---------------------------------------  Only for demo purposes
    var someTestPlaces = [
        Place(name: "UOC 22@",
              descriptionPlace: "La Universitat Oberta de Catalunya (UOC) és una universitat en línia[2][3] arrelada a Catalunya que forma les persones al llarg de la vida alhora que duu a terme recerca sobre la societat del coneixement.[4] El seu model educatiu es basa en la personalització i l’acompanyament de l’estudiant mitjançant l'aprenentatge en línia.[5]L'oferta acadèmica de la UOC inclou: graus, màsters, estudis de postgrau, especialitzacions, seminaris, cursos, assignatures per a cursar lliurement, cursos d’idiomes i programes de doctorat.[6] Les llengües que s’utilitzen per desenvolupar l’activitat acadèmica són totes les que aquesta requereixi en cada moment.Forma part de la Xarxa Vives d'Universitats, que integra universitats que imparteixen cursos en llengua catalana, anomenada així en honor a l'humanista Lluís Vives; i també és membre de l'ACUP, l'Associació Catalana d'Universitats Públiques,[7] i de la European Universities Association.[8]",
              webAddress: "https://www.uoc.edu/portal/ca/index.html",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 41.41, longitude: 2.13),
              imageName: "UOC 22@",
              iconTable: "Culture"),
        Place(name: "Rostisseria Lolita",
              descriptionPlace: "Els millors pollastres de Sant Cugat,de la comarca i dels multiversos coneguts...",
              webAddress: "https://es-es.facebook.com/rostisserialolita/",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 41.36, longitude: 2.07),
              imageName: "Rostisseria Lolita",
              iconTable: "Fast Food"),
        Place(name: "CIFO L'hospitalet",
              descriptionPlace: "El Centre d’Innovació i Formació per a l’Ocupació (CIFO) de l’Hospitalet ofereix formació en les àrees d’Edició i de Disseny gràfic i Multimèdia, a treballadors en actiu i en situació de desocupació dels sectors de disseny gràfic  i de l’audiovisual clàssic, amb l'objectiu de brindar l'especialització necessària per dedicar-se als àmbits emergents del disseny gràfic multiplataforma, el multimèdia editorial -especialment en l’àmbit de productes educatius-, la formació on-line, i l’animació, el videojoc i la creació d’entorns virtuals. ",
              webAddress: "http://serveiocupacio.gencat.cat/ca/soc/centres-dinnovacio-i-formacio-ocupacional-cifo/cifo-lhospitalet-de-llobregat/",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 41.35, longitude: 2.11),
              imageName: "cifo",
              iconTable: "Culture"),
        Place(name: "Out of china",
              descriptionPlace: "La cuina xinesa està íntimament relacionada, no només amb la societat, sinó també amb la filosofia i la medicina xinesa. Distingeix entre l' cai (verdures cuinades i per extensió tot el que acompanya els cereals) i els cereals en si, el fan . Els aliments Yin (femenins) són aliments tendres i rics en aigua com les fruites i les verdures, i tenen un efecte resfrescant. Els aliments yang (masculins) inclouen els plats fregits, especiats i a base de carns, i serveixen per reescalfar. Si tot menjar ha d'harmonitzar els sabors, els menjars xinesos també han de buscar un equilibri entre el fred i el calent, els colors i la consistència dels diversos aliments. Per això les tècniques culinàries xineses són nombroses i particularment variades. La successió de plats tal com es coneix als països occidentals és substituïda per la recerca de l'equilibri entre els cinc sabors bàsics (dolç, salat, àcid, amarg i picant). Per això, els plats amb gust exclusivament dolç només s'ofereixen al final dels festins donats amb motiu de grans celebracions. La vista també juga un paper important en la presentació dels plats. Alguns plats se serveixen amb fins essencialment terapèutics, com els nius d'orenetes o les aletes de taurons, que són ingredients insípids. El concepte de la complementarietat entre el fred i el calent, heretat de la medicina xinesa, es pren particularment en compte a la Cuina del sud de la Xina.",
              webAddress: "http://www.outofchinabarcelona.com/",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 41.39, longitude: 2.15),
              imageName: "outOfChina",
              iconTable: "Asian Restaurant"),
        Place(name: "CosmoCaixa",
              descriptionPlace: "CosmoCaixa Barcelona es un museo de ciencias perteneciente a la Obra Social de situado en Barcelona. Fue inaugurado en el año 2004 tras la remodelación de su predecesor, el Museo de Ciencias de Barcelona, inaugurado en 1981. La Caixa era propietaria de otro museo homólogo en Alcobendas (Madrid), llamado CosmoCaixa Madrid. Este museo cerró sus puertas el 31 de diciembre de 2013. En 2006, el Foro Europeo de Museos le otorgó el Premio del museo europeo del año, galardón que reconoce cada año a los nuevos museos que han realizado avances e innovaciones en el ámbito museístico. El museo galardonado alberga durante un año la estatua de Henry Moore The Egg, que simboliza el premio. Junto con el Museo Guggenheim de Bilbao (2000), el Museo Arqueológico Provincial de Alicante (2004) y el Museo de Medina Azahara (2012), son los cuatro únicos museos de España que han recibido el premio.",
              webAddress: "https://cosmocaixa.es/es/cosmocaixa-barcelona",
              image_in: nil,
              position: CLLocationCoordinate2D(latitude: 41.39, longitude: 2.15),
              imageName: "CosmoCaixa",
              iconTable: "Museum"),
    ]
}
