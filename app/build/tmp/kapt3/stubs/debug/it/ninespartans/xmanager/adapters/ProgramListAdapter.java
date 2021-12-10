package it.ninespartans.xmanager.adapters;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u0001\"B\u001b\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0010\u0007J\b\u0010\u0017\u001a\u00020\u0018H\u0016J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u001a\u001a\u00020\u0018H\u0016J\u0010\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001a\u001a\u00020\u0018H\u0016J$\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001a\u001a\u00020\u00182\b\u0010\u001f\u001a\u0004\u0018\u00010\u001e2\b\u0010 \u001a\u0004\u0018\u00010!H\u0016R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R.\u0010\u000b\u001a\u0016\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u000e\u0018\u00010\fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000f\u0010\u0010\"\u0004\b\u0011\u0010\u0012R \u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0013\u0010\u0014\"\u0004\b\u0015\u0010\u0016\u00a8\u0006#"}, d2 = {"Lit/ninespartans/xmanager/adapters/ProgramListAdapter;", "Landroid/widget/BaseAdapter;", "context", "Landroid/content/Context;", "programs", "Lio/realm/RealmResults;", "Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "(Landroid/content/Context;Lio/realm/RealmResults;)V", "inflater", "Landroid/view/LayoutInflater;", "mContext", "onClickActionOnItem", "Lkotlin/Function2;", "Lit/ninespartans/xmanager/adapters/ProgramListAdapter$Action;", "", "getOnClickActionOnItem", "()Lkotlin/jvm/functions/Function2;", "setOnClickActionOnItem", "(Lkotlin/jvm/functions/Function2;)V", "getPrograms", "()Lio/realm/RealmResults;", "setPrograms", "(Lio/realm/RealmResults;)V", "getCount", "", "getItem", "position", "getItemId", "", "getView", "Landroid/view/View;", "convertView", "viewGroup", "Landroid/view/ViewGroup;", "Action", "app_debug"})
public final class ProgramListAdapter extends android.widget.BaseAdapter {
    private final android.content.Context mContext = null;
    private android.view.LayoutInflater inflater;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> programs;
    @org.jetbrains.annotations.Nullable()
    private kotlin.jvm.functions.Function2<? super it.ninespartans.xmanager.adapters.ProgramListAdapter.Action, ? super it.ninespartans.xmanager.model.TrainingSessionProgram, kotlin.Unit> onClickActionOnItem;
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> getPrograms() {
        return null;
    }
    
    public final void setPrograms(@org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function2<it.ninespartans.xmanager.adapters.ProgramListAdapter.Action, it.ninespartans.xmanager.model.TrainingSessionProgram, kotlin.Unit> getOnClickActionOnItem() {
        return null;
    }
    
    public final void setOnClickActionOnItem(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function2<? super it.ninespartans.xmanager.adapters.ProgramListAdapter.Action, ? super it.ninespartans.xmanager.model.TrainingSessionProgram, kotlin.Unit> p0) {
    }
    
    @java.lang.Override()
    public int getCount() {
        return 0;
    }
    
    @java.lang.Override()
    public long getItemId(int position) {
        return 0L;
    }
    
    @org.jetbrains.annotations.Nullable()
    @java.lang.Override()
    public it.ninespartans.xmanager.model.TrainingSessionProgram getItem(int position) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public android.view.View getView(int position, @org.jetbrains.annotations.Nullable()
    android.view.View convertView, @org.jetbrains.annotations.Nullable()
    android.view.ViewGroup viewGroup) {
        return null;
    }
    
    public ProgramListAdapter(@org.jetbrains.annotations.NotNull()
    android.content.Context context, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> programs) {
        super();
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004\u00a8\u0006\u0005"}, d2 = {"Lit/ninespartans/xmanager/adapters/ProgramListAdapter$Action;", "", "(Ljava/lang/String;I)V", "UPDATE_PROGRAM", "DELETE_PROGRAM", "app_debug"})
    public static enum Action {
        /*public static final*/ UPDATE_PROGRAM /* = new UPDATE_PROGRAM() */ /*enum*/ ,
        /*public static final*/ DELETE_PROGRAM /* = new DELETE_PROGRAM() */ /*enum*/ ;
        
        Action() {
        }
    }
}