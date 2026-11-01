# SQUABIX Audio Nodes

Audio nodes for games. Play sounds from signals, footsteps, and distance.

## Classes

- `SignalAudioManager`
- `SignalAudioManager3D`
- `CharacterAudioStreamPlayer3D`
- `AudioStreamCurver3D`

## Use

1. Add a `SignalAudioManager` as a child of the node with the signals.
2. Fill `signal_players` with a signal name and an audio player for each sound.
3. Add a `CharacterAudioStreamPlayer3D` for footsteps and other similar repeated sounds. Set `character`.
4. Add an `AudioStreamCurver3D` to set volume from distance with a curve. Set `position`.

## Demo

See it in the game: https://github.com/squabix/craftlander

## Needs

Godot 4.5 or newer.

## License

MIT. See `LICENSE`.
Icons are from another project. See `THIRD_PARTY.md`.
