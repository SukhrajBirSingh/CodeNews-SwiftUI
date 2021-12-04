
import SwiftUI

struct ContentView: View {
    
@ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        
                        VStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(post.points))
                        }
                        Text(post.title)
                            .padding(.vertical)
                    }
                }
                
           }
        
        .navigationTitle("Code News")
            
        
        }
        
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


//let posts = [
//Post(id: "1", title: "hello"),
//Post(id: "2", title: "hey"),
//Post(id: "3", title: "hey there")
//]


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
