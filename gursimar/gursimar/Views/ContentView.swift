//
//  ContentView.swift
//  gursimar
//
//  Created by Gursimar on 11/11/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selectedTab: Tab = .Chat
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showAlert = false
    @State private var selectedTabValue = 0
    @State private var searchText = ""
    @State private var isSearching = false
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select Tab", selection: $selectedTabValue) {
                    Text("Individual").tag(0)
                    Text("Professional").tag(1)
                    Text("Merchant").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TabView(selection: $selectedTabValue) {
                    VStack (spacing: 0) {
                        HStack(spacing: 0) {
                            SearchBar(searchText: $searchText, isSearching: $isSearching).padding(.trailing, 0)
                            Button("", systemImage: "circle.fill") {
                                print("Filter")
                            }
                        }
                        ScrollView {
                            Spacer()
                            UserRow(item: UserStruct(imageName: "person", userName: "Michael Murphy", location: "San Fransisco", hobbies: ["Friendship", "Coffee", "Hangout"], profileDescription: "Hi community! I am open to new connections!", invitationStatus: .Invite))
                            Spacer()
                            UserRow(item: UserStruct(imageName: "person", userName: "Michael Murphy", location: "San Fransisco", hobbies: ["Friendship", "Coffee", "Hangout"], profileDescription: "Hi community! I am open to new connections!", invitationStatus: .Invite))
                            Spacer()
                            UserRow(item: UserStruct(imageName: "person", userName: "Michael Murphy", location: "San Fransisco", hobbies: ["Friendship", "Coffee", "Hangout"], profileDescription: "Hi community! I am open to new connections!", invitationStatus: .Invite))
                            Spacer()
                            UserRow(item: UserStruct(imageName: "person", userName: "Michael Murphy", location: "San Fransisco", hobbies: ["Friendship", "Coffee", "Hangout"], profileDescription: "Hi community! I am open to new connections!", invitationStatus: .Invite))
                            Spacer()
                        }
                    }.tag(0)
                    
                    Text("Professional Content")
                        .tag(1)
                    
                    Text("Merchant Content")
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Add another button on the left side
                    Button(action: {
                        // Handle the action for the new button
                    }) {
                        Label("Left Icon", systemImage: "circle.fill")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    // Explore title and location icon with address
                    VStack(alignment: .leading) {
                        Text("Explore").bold().font(.system(size: 16))
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text("San Francisco").font(.system(size: 14))
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Button for the notification
                    Button(action: {
                        showAlert = true
                    }) {
                        Label("Notification", systemImage: "bell")
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Alert Title"),
                            message: Text("This is a message."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                }
            }
            .background(Color.white)
        }
        ExploreTabBar(selectedTab: $selectedTab)
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
