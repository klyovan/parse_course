
class Video {

  String name;
  String duration;

  Video(this.name, this.duration);

  @override
  String toString() {
    return 'Name: $name, Duration: $duration';
  }
}