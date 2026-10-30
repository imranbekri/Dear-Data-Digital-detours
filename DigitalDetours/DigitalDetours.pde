
Table data;

void setup() {
  size(900, 900);

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

  // Title
  fill(0);
  textAlign(CENTER);
  textSize(28);
  text("Digital Detours", width / 2, 38);

  textSize(14);
  text("Each circle represents one phone-use observation",
       width / 2, 65);

  // Colour key
  fill(220, 65, 65);
  ellipse(320, 93, 14, 14);
  fill(0);
  text("Detour", 375, 98);

  fill(60, 165, 90);
  ellipse(480, 93, 14, 14);
  fill(0);
  text("No detour", 558, 98);

  // Display observations
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);

    int id = row.getInt("id");
    int minutes = row.getInt("minutes");
    String detour = row.getString("detour");

    // Position: five circles per row
    float x = 110 + (i % 5) * 170;
    float y = 165 + (i / 5) * 105;

    float circleSize = getCircleSize(minutes);

    // Choose circle colour
    if (detour.equals("yes")) {
      fill(220, 65, 65);
    } else {
      fill(60, 165, 90);
    }

    noStroke();
    ellipse(x, y, circleSize, circleSize);

    // Observation label
    fill(0);
    textSize(12);
    text("ID " + id + " | " + minutes + " min",
         x, y + 48);
  }
}

// Method returning a value
float getCircleSize(int minutes) {
  return constrain(minutes * 0.6, 14, 70);
}
