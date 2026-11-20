Table data;

void setup() {
  size(900, 710);

  data = loadTable("observations.csv", "header");

  if (data == null) {
    println("Could not load observations.csv from the data folder.");
    exit();
    return;
  }

  println("Number of observations: " + data.getRowCount());
}

void draw() {
  background(255);

  fill(0);
  textAlign(CENTER);
  textSize(28);
  text("Digital Detours", width / 2, 38);

  textSize(14);
  text("Each circle represents one phone-use observation",
       width / 2, 65);

  fill(220, 65, 65);
  ellipse(320, 93, 14, 14);
  fill(0);
  text("Detour", 375, 98);

  fill(60, 165, 90);
  ellipse(480, 93, 14, 14);
  fill(0);
  text("No detour", 558, 98);

  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.findRow(str(i + 1), "id");
    if (row == null) continue;

    int id = row.getInt("id");
    int minutes = row.getInt("minutes");
    String detour = row.getString("detour");
    String startApp = row.getString("start_app");
    String endApp = row.getString("end_app");

PhoneSession session = new PhoneSession(
  id, minutes, startApp, endApp, detour
);

    float x = 45 + (i % 10) * 90;
    float y = 145 + (i / 10) * 52;

    session.display(x, y);
  }
}

float getCircleSize(int minutes) {
  return constrain(minutes * 0.25, 8, 25);
}

class PhoneSession {
  int id;
  int minutes;
  String startApp;
  String endApp;
  String detour;

  PhoneSession(int id, int minutes,
               String startApp, String endApp,
               String detour) {
    this.id = id;
    this.minutes = minutes;
    this.startApp = startApp;
    this.endApp = endApp;
    this.detour = detour;
  }

  void display(float x, float y) {
    if (detour.equals("yes")) {
      fill(220, 65, 65);
    } else {
      fill(60, 165, 90);
    }

    noStroke();

    float circleSize = constrain(minutes * 0.25, 8, 25);
    ellipse(x, y, circleSize, circleSize);

    fill(0);
    textAlign(CENTER);
    textSize(10);
    text("ID " + id, x, y + 23);
  }
}
