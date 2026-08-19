extends Node

signal documents_changed(collected: int, required: int)
signal document_collected(slot: int)
signal final_run_started
signal boiled_encounter_consumed
signal boiled_influence_changed(active: bool)

const REQUIRED_DOCUMENTS := 10

var run_seed: int = 0
var documents_collected: int = 0
var document_mask: int = 0
var boiled_encounter_used: bool = false
var boiled_influenced: bool = false
var final_run_active: bool = false

func begin_new_run(seed: int) -> void:
	run_seed = seed
	documents_collected = 0
	document_mask = 0
	boiled_encounter_used = false
	boiled_influenced = false
	final_run_active = false
	documents_changed.emit(documents_collected, REQUIRED_DOCUMENTS)
	boiled_influence_changed.emit(false)

func is_document_collected(slot: int) -> bool:
	if slot < 0 or slot >= REQUIRED_DOCUMENTS:
		return false
	return (document_mask & (1 << slot)) != 0

func collect_document(slot: int) -> bool:
	if slot < 0 or slot >= REQUIRED_DOCUMENTS or is_document_collected(slot):
		return false

	document_mask |= 1 << slot
	documents_collected = mini(REQUIRED_DOCUMENTS, documents_collected + 1)
	document_collected.emit(slot)
	documents_changed.emit(documents_collected, REQUIRED_DOCUMENTS)

	if documents_collected >= REQUIRED_DOCUMENTS and not final_run_active:
		final_run_active = true
		final_run_started.emit()
	return true

func consume_boiled_encounter() -> void:
	if boiled_encounter_used:
		return
	boiled_encounter_used = true
	boiled_encounter_consumed.emit()

func mark_boiled_influenced() -> void:
	if boiled_influenced:
		return
	boiled_influenced = true
	boiled_influence_changed.emit(true)

func restore(data: Dictionary) -> void:
	run_seed = int(data.get("run_seed", 0))
	document_mask = int(data.get("document_mask", 0))
	documents_collected = clampi(int(data.get("documents_collected", 0)), 0, REQUIRED_DOCUMENTS)
	boiled_encounter_used = bool(data.get("boiled_encounter_used", false))
	boiled_influenced = bool(data.get("boiled_influenced", false))
	final_run_active = bool(data.get("final_run_active", documents_collected >= REQUIRED_DOCUMENTS))
	documents_changed.emit(documents_collected, REQUIRED_DOCUMENTS)
	boiled_influence_changed.emit(boiled_influenced)
