//
//  UpcomingSubscriptionEffect.swift
//  Abono
//
//  Created by Achraf Trabelsi on 22/08/2022.
//

import ComposableArchitecture

#warning("TODO : Implement Firebase Firestore call")
func upcomingSubsEffect(decoder: JSONDecoder) -> Effect<[UpcomingSubscriptionModel], APIError> {
    guard let url = URL(string: "https://api.github.com/users/raywenderlich") else {
        fatalError("Error on creating url")
    }
    return URLSession.shared.dataTaskPublisher(for: url)
        .mapError { _ in APIError.downloadError }
        .map { data, _ in data }
        .decode(type: [UpcomingSubscriptionModel].self, decoder: decoder)
        .mapError { _ in APIError.decodingError }
        .eraseToEffect()
}

func dummyUpcomingSubsEffect(decoder: JSONDecoder) -> Effect<[UpcomingSubscriptionDataView], APIError> {
    let dummyUpcomingSubs: [UpcomingSubscriptionDataView] = [
        UpcomingSubscriptionModel(name: "Netflix", icon: "netflix_ic", amount: "$13,99 / mo", category: "Entertainment").map(),
        UpcomingSubscriptionModel(name: "Spotify", icon: "spotify_ic", amount: "$80,99 / yr", category: "Music").map(),
        UpcomingSubscriptionModel(name: "Uber Eat", icon: "uber_eat_ic", amount: "$3,99 / mo", category: "Food & Drinks").map(),
        UpcomingSubscriptionModel(name: "Amazon Prime", icon: "prime_ic", amount: "$5,99 / mo", category: "Video").map()
    ]
    return Effect(value: dummyUpcomingSubs)
}
