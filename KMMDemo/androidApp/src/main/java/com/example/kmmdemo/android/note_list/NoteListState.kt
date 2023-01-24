package com.example.kmmdemo.android.note_list

import com.example.kmmdemo.domain.note.Note

data class NoteListState(
    val notes: List<Note> = emptyList(),
    val searchText: String = "",
    val isSearchActive: Boolean = false
)
