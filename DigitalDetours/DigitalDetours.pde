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

    float x = 110 + (i % 5) * 170;
    float y = 145 + (i / 5) * 72;

    float circleSize = getCircleSize(minutes);

    if (detour.equals("yes")) {
      fill(220, 65, 65);
    } else {
      fill(60, 165, 90);
    }

    noStroke();
    ellipse(x, y, circleSize, circleSize);
 
    fill(0);
    textSize(12);
    text("ID " + id + " | " + minutes + " min",
         x, y + 30);
  }
}

float getCircleSize(int minutes) {
  return constrain(minutes * 0.4, 12, 40);
}
