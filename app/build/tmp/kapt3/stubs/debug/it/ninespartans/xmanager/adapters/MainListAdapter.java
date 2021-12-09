package it.ninespartans.xmanager.adapters;

import java.lang.System;

@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001:\u00010B)\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0005\u00a2\u0006\u0002\u0010\tJ\b\u0010%\u001a\u00020&H\u0016J\u0012\u0010\'\u001a\u0004\u0018\u00010\u00062\u0006\u0010(\u001a\u00020&H\u0016J\u0010\u0010)\u001a\u00020*2\u0006\u0010(\u001a\u00020&H\u0016J$\u0010+\u001a\u00020,2\u0006\u0010(\u001a\u00020&2\b\u0010-\u001a\u0004\u0018\u00010,2\b\u0010.\u001a\u0004\u0018\u00010/H\u0016R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R(\u0010\r\u001a\u0010\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014R.\u0010\u0015\u001a\u0016\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u0010\u0018\u00010\u0016X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR \u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR \u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\b0\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001f\u0010\u001c\"\u0004\b \u0010\u001eR\u0011\u0010!\u001a\u00020\"\u00a2\u0006\b\n\u0000\u001a\u0004\b#\u0010$\u00a8\u00061"}, d2 = {"Lit/ninespartans/xmanager/adapters/MainListAdapter;", "Landroid/widget/BaseAdapter;", "context", "Landroid/content/Context;", "players", "Lio/realm/RealmResults;", "Lit/ninespartans/xmanager/model/Player;", "programs", "Lit/ninespartans/xmanager/model/TrainingSessionProgram;", "(Landroid/content/Context;Lio/realm/RealmResults;Lio/realm/RealmResults;)V", "inflater", "Landroid/view/LayoutInflater;", "mContext", "onClickAction", "Lkotlin/Function1;", "Lit/ninespartans/xmanager/adapters/MainListAdapter$Action;", "", "getOnClickAction", "()Lkotlin/jvm/functions/Function1;", "setOnClickAction", "(Lkotlin/jvm/functions/Function1;)V", "onClickActionOnItem", "Lkotlin/Function2;", "getOnClickActionOnItem", "()Lkotlin/jvm/functions/Function2;", "setOnClickActionOnItem", "(Lkotlin/jvm/functions/Function2;)V", "getPlayers", "()Lio/realm/RealmResults;", "setPlayers", "(Lio/realm/RealmResults;)V", "getPrograms", "setPrograms", "realm", "Lio/realm/Realm;", "getRealm", "()Lio/realm/Realm;", "getCount", "", "getItem", "position", "getItemId", "", "getView", "Landroid/view/View;", "convertView", "viewGroup", "Landroid/view/ViewGroup;", "Action", "app_debug"})
public final class MainListAdapter extends android.widget.BaseAdapter {
    private final android.content.Context mContext = null;
    private android.view.LayoutInflater inflater;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> programs;
    @org.jetbrains.annotations.NotNull()
    private io.realm.RealmResults<it.ninespartans.xmanager.model.Player> players;
    @org.jetbrains.annotations.NotNull()
    private final io.realm.Realm realm = null;
    @org.jetbrains.annotations.Nullable()
    private kotlin.jvm.functions.Function1<? super it.ninespartans.xmanager.adapters.MainListAdapter.Action, kotlin.Unit> onClickAction;
    @org.jetbrains.annotations.Nullable()
    private kotlin.jvm.functions.Function2<? super it.ninespartans.xmanager.adapters.MainListAdapter.Action, ? super it.ninespartans.xmanager.model.Player, kotlin.Unit> onClickActionOnItem;
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> getPrograms() {
        return null;
    }
    
    public final void setPrograms(@org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.RealmResults<it.ninespartans.xmanager.model.Player> getPlayers() {
        return null;
    }
    
    public final void setPlayers(@org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.Player> p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final io.realm.Realm getRealm() {
        return null;
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function1<it.ninespartans.xmanager.adapters.MainListAdapter.Action, kotlin.Unit> getOnClickAction() {
        return null;
    }
    
    public final void setOnClickAction(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function1<? super it.ninespartans.xmanager.adapters.MainListAdapter.Action, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function2<it.ninespartans.xmanager.adapters.MainListAdapter.Action, it.ninespartans.xmanager.model.Player, kotlin.Unit> getOnClickActionOnItem() {
        return null;
    }
    
    public final void setOnClickActionOnItem(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function2<? super it.ninespartans.xmanager.adapters.MainListAdapter.Action, ? super it.ninespartans.xmanager.model.Player, kotlin.Unit> p0) {
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
    public it.ninespartans.xmanager.model.Player getItem(int position) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public android.view.View getView(int position, @org.jetbrains.annotations.Nullable()
    android.view.View convertView, @org.jetbrains.annotations.Nullable()
    android.view.ViewGroup viewGroup) {
        return null;
    }
    
    public MainListAdapter(@org.jetbrains.annotations.NotNull()
    android.content.Context context, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.Player> players, @org.jetbrains.annotations.NotNull()
    io.realm.RealmResults<it.ninespartans.xmanager.model.TrainingSessionProgram> programs) {
        super();
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0011\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011\u00a8\u0006\u0012"}, d2 = {"Lit/ninespartans/xmanager/adapters/MainListAdapter$Action;", "", "(Ljava/lang/String;I)V", "CREATE_USER", "ADD_PLAYER", "EDIT_PLAYER", "DELETE_PLAYER", "DISABLE_PLAYER", "COMPLETE_DEVICES", "UPDATE_DEVICES", "DELETE_DEVICES", "TURN_OFF_DEVICES", "SHOW_PROGRAM", "CREATE_PROGRAM", "DELETE_PROGRAM", "UPLOAD_PROGRAM", "START_PROGRAM", "STOP_PROGRAM", "app_debug"})
    public static enum Action {
        /*public static final*/ CREATE_USER /* = new CREATE_USER() */ /*enum*/ ,
        /*public static final*/ ADD_PLAYER /* = new ADD_PLAYER() */ /*enum*/ ,
        /*public static final*/ EDIT_PLAYER /* = new EDIT_PLAYER() */ /*enum*/ ,
        /*public static final*/ DELETE_PLAYER /* = new DELETE_PLAYER() */ /*enum*/ ,
        /*public static final*/ DISABLE_PLAYER /* = new DISABLE_PLAYER() */ /*enum*/ ,
        /*public static final*/ COMPLETE_DEVICES /* = new COMPLETE_DEVICES() */ /*enum*/ ,
        /*public static final*/ UPDATE_DEVICES /* = new UPDATE_DEVICES() */ /*enum*/ ,
        /*public static final*/ DELETE_DEVICES /* = new DELETE_DEVICES() */ /*enum*/ ,
        /*public static final*/ TURN_OFF_DEVICES /* = new TURN_OFF_DEVICES() */ /*enum*/ ,
        /*public static final*/ SHOW_PROGRAM /* = new SHOW_PROGRAM() */ /*enum*/ ,
        /*public static final*/ CREATE_PROGRAM /* = new CREATE_PROGRAM() */ /*enum*/ ,
        /*public static final*/ DELETE_PROGRAM /* = new DELETE_PROGRAM() */ /*enum*/ ,
        /*public static final*/ UPLOAD_PROGRAM /* = new UPLOAD_PROGRAM() */ /*enum*/ ,
        /*public static final*/ START_PROGRAM /* = new START_PROGRAM() */ /*enum*/ ,
        /*public static final*/ STOP_PROGRAM /* = new STOP_PROGRAM() */ /*enum*/ ;
        
        Action() {
        }
    }
}