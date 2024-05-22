//
//  CarsModel.swift
//  Shop
//
//  Created by Luciano Lima Ferreira on 22/05/24.
//

import SwiftUI

struct CarsModel: Identifiable, Hashable {
    var id: String
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var reviews: [ReviewModel]
    var price: Double
}

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Double
}

//MARK: mocks

var sampleCarsMock: [CarsModel] = [
    .init(
        id: "1",
        title: "911 Carrera",
        brand: "Porsche",
        description: "Elegante. Purista. Inconfundível: em 1963, F. A. Porsche foi consagrado com o sucesso da silhueta do 911. Com suas linhas claras e a união de forma e função. Mais de 50 anos depois, o mundo conhece muitos carros esporte. Mas apenas um 911.",
        images: [
            "https://www.stuttgartporsche.com.br/pub/menu/menu_911-carrer_3_210601_5909.png",
            "https://www.stuttgartporsche.com.br//pub/modelos/versao/ofertas/o-novo-911-carrera-cabriolet_oferta_210529_3918.jpg"
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "2",
        title: "911 GT3",
        brand: "Porsche",
        description: "Os outros aproveitam o dia. Nós tiramos o máximo de cada segundo. Pois sabemos: o tempo é precioso. E cada momento no cockpit é valioso. Então intensificamos no novo 911 GT3 uma vez mais tudo aquilo que caracteriza um carro esporte: a aerodinâmica, o desempenho, o ajuste, o prazer de dirigir. E a adrenalina. O tempo corre. Está na hora.",
        images: [
            "https://www.stuttgartporsche.com.br/pub/menu/menu_911-gt3_3_210601_5930.png"],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "3",
        title: "BMW iX1",
        brand: "BMW",
        description: "O BMW iX1 totalmente elétrico, irradia determinação, com a sua funcionalidade e versatilidade, oferece inspiração para seguir novos caminhos, mesmo na utilização diária.",
        images: [
            "https://www.lloydmotorgroup.com/ImageLibrary/images/BMW/Retail/Master/New%20Cars/i%20Cars/iX1%20Gallery/BMW-iX1-Thumbnail.png?mode=max&upscale=true&width=640",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "4",
        title: "M8 Coupé",
        brand: "BMW",
        description: "Com os novos modelos BMW Série 8 Coupé M você experimenta o máximo prazer de condução esportiva e luxuosa, tanto na estrada quanto nas pistas de corrida.",
        images: [
            "https://www.lloydmotorgroup.com/ImageLibrary/images/BMW/Retail/Master/New%20Cars/M%20Cars/M8%20Gallery/BMW-M8-competition-thumb.png?mode=max&upscale=true&width=640",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "5",
        title: "AMG G 63[1]",
        brand: "Mercedes",
        description: "O Mercedes-AMG G 63 significa potência à primeira vista: a grade do radiador específica da AMG, as rodas de 55,9 cm (22') disponíveis como opção, assim como o marcante sistema de escape AMG Performance, com duas ponteiras duplas cromadas de ambos os lados, conferem a este objeto de culto o seu exterior extrovertido.",
        images: [
            "https://vehicle-images.dealerinspire.com/stock-images/chrome/a656590feb88dae311d0011e004b757f.png",
            "https://vehicle-images.dealerinspire.com/stock-images/chrome/2f1ef70d3cf37c0920f1fa4b324516ac.png",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "6",
        title: "Classe E Sedan",
        brand: "Mercedes",
        description: "Desde o revestimento do radiador iluminado até a traseira elegante e dinâmica, com detalhes de iluminação fascinantes: o novo Classe E Sedan possui um design inspirador e avança em uma dinâmica inovadora com elementos de design progressivos.",
        images: [
            "https://rk.mb-qr.com/media/thumbnails/cards/214.204_Front_V1.png.1000x1000_q95.png",
            "https://rk.mb-qr.com/media/thumbnails/cards/214.204_Rear_V1.png.1000x1000_q95.png",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "7",
        title: "Model X",
        brand: "Tesla",
        description: "Desde o revestimento do radiador iluminado até a traseira elegante e dinâmica, com detalhes de iluminação fascinantes: o novo Classe E Sedan possui um design inspirador e avança em uma dinâmica inovadora com elementos de design progressivos.",
        images: [
            "https://platform.cstatic-images.com/xxlarge/in/v2/stock_photos/909cd004-1eb1-46a3-b3d5-f7eca4175d23/a4e9535e-20e5-4838-a1ff-790f651a37b8.png",
            "https://static-assets.tesla.com/configurator/compositor?context=design_studio_2&options=$MTX18,$PPSW,$WX00,$IBE00&view=FRONT34&model=mx&size=1920&bkba_opt=2&crop=0,0,0,0&",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
    .init(
        id: "8",
        title: "Model S",
        brand: "Tesla",
        description: "Desde o revestimento do radiador iluminado até a traseira elegante e dinâmica, com detalhes de iluminação fascinantes: o novo Classe E Sedan possui um design inspirador e avança em uma dinâmica inovadora com elementos de design progressivos.",
        images: [
            "https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/b0a52b41-0262-44c8-b790-c45233f8de84/68b9f3f7-ca9c-4e7d-8c76-8403d766fb4a.png",
            "https://platform.cstatic-images.com/xlarge/in/v2/stock_photos/b0a52b41-0262-44c8-b790-c45233f8de84/bea82c18-b839-4bfb-a135-a2a44cc3a79a.png",
        ],
        reviews: [sampleReview],
        price: 30000
    ),
]

var sampleReview: ReviewModel = .init(
    id: "1",
    userName: "Elon Musk",
    image: "https://www.psd.org.br/wp-content/uploads/2014/08/Og-Pozzoli.jpg",
    review: "Esse eu também tenho.",
    rating: 4.3
)
