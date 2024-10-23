import Text "mo:base/Text";

import Array "mo:base/Array";
import Int "mo:base/Int";
import Iter "mo:base/Iter";
import Option "mo:base/Option";
import Order "mo:base/Order";

actor {
  stable var highScores : [(Text, Int)] = [];

  public func addHighScore(name : Text, score : Int) : async () {
    highScores := Array.sort<(Text, Int)>(
      Array.append([(name, score)], highScores),
      func(a, b) { Int.compare(b.1, a.1) }
    );
    if (highScores.size() > 10) {
      highScores := Iter.toArray(Array.slice(highScores, 0, 10));
    };
  };

  public query func getHighScores() : async [(Text, Int)] {
    highScores
  };
}
