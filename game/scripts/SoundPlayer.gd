extends Node3D

class_name SoundManager_

@onready var MusicPlayer: AudioStreamPlayer = $MusicPlayer
@onready var MusicTimer: Timer = $MusicPlayer/MusicTimer
@onready var SoundPlayers: Array[AudioStreamPlayer3D] = [$">>3dSounds/A1", $">>3dSounds/A2", $">>3dSounds/A3", $">>3dSounds/A4", $">>3dSounds/A5", $">>3dSounds/A6", $">>3dSounds/A7", $">>3dSounds/A8", $">>3dSounds/A9", $">>3dSounds/A10", $">>3dSounds/A11", $">>3dSounds/A12", $">>3dSounds/A13", $">>3dSounds/A14", $">>3dSounds/A15", $">>3dSounds/A16", $">>3dSounds/A17", $">>3dSounds/A18", $">>3dSounds/A19", $">>3dSounds/A20", $">>3dSounds/A21", $">>3dSounds/A22", $">>3dSounds/A23", $">>3dSounds/A24"]
@onready var SoundPlayerUI: AudioStreamPlayer = $UISoundPlayer

@export var Track1: AudioStream
@export var Track2: AudioStream

enum TrackNumber{
	GoblinsAttack,
	Tutorial
}

var CanPlayMusic: bool = true
var CurrentSoundStreamer: int = 1
var MusicStarted: bool = false

func _ready():
	set_process(false)
	if(Track1 == null):
		CanPlayMusic = false
		printerr("Music: Track 1 missing")
	if(Track2 == null):
		CanPlayMusic = false
		printerr("Music: Track 2 missing")


func PlaySound_3D(SoundFile: String, Pos:Vector3, Volume: float, Pitch: float):
	var Soundplayer: AudioStreamPlayer3D = SoundPlayers[CurrentSoundStreamer]
	Soundplayer.stream = load(SoundFile)
	Soundplayer.position = Pos
	Soundplayer.pitch_scale = Pitch
	Soundplayer.volume_db = Volume
	Soundplayer.play()


func PlaySound_UI(SoundFile: String):
	SoundPlayerUI.stream = load(SoundFile)
	SoundPlayerUI.play()


func Track(TrackToPlay: TrackNumber):
	if(TrackToPlay == TrackNumber.GoblinsAttack):
		MusicPlayer.stream = Track1
	if(TrackToPlay == TrackNumber.Tutorial):
		MusicPlayer.stream = Track2
	
	MusicPlayer.volume_db = 0
	MusicPlayer.play()

func SetMusicTimer(TrackToPlay: TrackNumber):
	MusicTimer.stop()
	if(TrackToPlay == TrackNumber.GoblinsAttack):
		MusicTimer.start(20)
	if(TrackToPlay == TrackNumber.Tutorial):
		MusicTimer.start(5)

func PlayMusic(TrackToPlay: TrackNumber):
	if(CanPlayMusic == true):
		SetMusicTimer(TrackToPlay)
		if(MusicStarted == false):
			MusicStarted = true
			Track(TrackToPlay)
			set_process(true)

func _process(delta):
	if(MusicStarted == false):
		MusicPlayer.volume_db -= 5 * delta
		if(MusicPlayer.volume_db <= -50):
			MusicPlayer.stop()
			set_process(false)

func _on_music_timer_timeout():
	MusicStarted = false
