import SwiftUI
 
let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
 
struct CountdownTimer: View {
     
    @State var counter: Int = 0
    var countTo: Int = 120 //4 minutes 120 - 2minutes
    var width: CGFloat
    var height: CGFloat
    var fontSize: CGFloat
    var lineWidth: CGFloat
     
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.clear)
                    .frame(width: width, height: height)
                    .overlay(
                        Circle().stroke(Color("indigoLow"), lineWidth: lineWidth)
                )
                 
                Circle()
                    .fill(Color.clear)
                    .frame(width: width, height: height)
                    .overlay(
                        Circle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: lineWidth,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (completed() ? Color("indigoMain"): Color.white)
                            )
                            .animation(.easeInOut)

                    )
                 
                Clock(counter: counter, countTo: countTo, fontSize: fontSize)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
        }
    }
     
    func completed() -> Bool {
        return progress() == 1
    }
     
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}
 
struct Clock: View {
    var counter: Int
    var countTo: Int
    var fontSize: CGFloat
     
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: fontSize))
                .fontWeight(.semibold)
                .foregroundColor(Color("indigoMain"))
        }
    }
     
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
         
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}
 
struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer(width: 100, height: 100, fontSize: 30, lineWidth: 10)
    }
}
