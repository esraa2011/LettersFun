import SwiftUI

struct ContentView: View {
    @State var lettersMode :Int = 0
    @State var userText = ""
    
    var body: some View {
        VStack{
            
            Spacer()
            
            switch lettersMode {
                
            case 1:
                Text(userText.uppercased()).font(.largeTitle)
                
            case 2:
                Text(userText.capitalized).font(.largeTitle)
            case 3:
                
                Text(userText.lowercased()).font(.largeTitle)
                
                
            default:
                Text("").font(.largeTitle).foregroundColor(Color.orange)
            }
            Spacer()
            Button(action:{
                switch lettersMode {
                    
                case 1:
                    UIPasteboard.general.string = userText.uppercased()
                    
                case 2:
                    UIPasteboard.general.string = userText.capitalized
                case 3:
                    
                    UIPasteboard.general.string = userText.lowercased()
                    
                    
                default:
                    UIPasteboard.general.string = " "
                }
                
            }) {
                ButtonsStyle(name: "Copy", color: .orange)
            }
            
            HStack{
                
                Button(action:{
                    lettersMode = 1
                }) {
                    ButtonsStyle(name: "Caps", color: .red)
                }
                
                
                Button(action:{
                    lettersMode = 2
                }) {
                    ButtonsStyle(name: "first Letter", color: .green)
                }
                
                
                Button(action:{
                    lettersMode = 3
                }) {
                    ButtonsStyle(name: "lowerCase", color: .blue)
                }
                
            }
            
            
            TextField("Enter Your Text ....",text: $userText)
                .font(.title2)
                .padding()
            
            
        }.padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct ButtonsStyle :View{
    var name :String
    var color:Color
    var body: some View {
        Text(name)
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .foregroundColor(.white)
            .font(.body)
            .cornerRadius(10)
        
        
    }
}
