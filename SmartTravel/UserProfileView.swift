//
//  UserProfileView.swift
//  SmartTravel
//
//  Created by Lionel Chen on 12/30/23.
//
import SwiftUI
import Firebase
import FirebaseFirestore

struct UserProfileView: View {
    @State private var homeCountry: String = ""
    @State private var birthDate = Date()
    @State private var pastTravelExperiences: String = ""
    @State private var favoredCuisines: String = ""
    @State private var travelDestination: String = ""
    @State private var travelStartDate = Date()
    @State private var travelEndDate = Date()
    @State private var dislikesRestrictions: String = ""
    @State private var shouldNavigateToHomePage = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Background Information")) {
                    TextField("Home Country", text: $homeCountry)
                    DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)
                    TextField("Past Travel Experiences", text: $pastTravelExperiences)
                }

                Section(header: Text("Preferences")) {
                    TextField("Favored Cuisines", text: $favoredCuisines)
                    TextField("Dislikes/Dietary Restrictions", text: $dislikesRestrictions)
                }

                Section(header: Text("Travel Destination")) {
                    TextField("Travel Destination", text: $travelDestination)
                    DatePicker("Start Date", selection: $travelStartDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $travelEndDate, displayedComponents: .date)
                }

                Button("Save & Continue") {
                    saveUserData()
                    shouldNavigateToHomePage = true
                }
            }
            .navigationDestination(isPresented: $shouldNavigateToHomePage) {
                HomePage()
            }
            .navigationBarTitle("User Profile", displayMode: .inline)
        }
    }

    func saveUserData() {
        let db = Firestore.firestore()
        let userProfile: [String: Any] = [
            "homeCountry": homeCountry,
            "birthday": birthDate,
            "pastTravelExperiences": pastTravelExperiences,
            "favoredCuisines": favoredCuisines,
            "travelDestination": travelDestination,
            "travelStartDate": travelStartDate,
            "travelEndDate": travelEndDate,
            "dislikesRestrictions": dislikesRestrictions
        ]

        let userID = "unique_user_id"  // Replace with actual user ID

        db.collection("userProfiles").document(userID).setData(userProfile) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
                shouldNavigateToHomePage = true
            }
        }
        print("User data saved to firebase backend")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
