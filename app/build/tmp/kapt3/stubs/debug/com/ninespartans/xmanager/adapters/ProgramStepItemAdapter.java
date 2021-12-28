package com.ninespartans.xmanager.adapters;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\f\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u000e\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0007J\b\u0010\u001d\u001a\u00020\u0014H\u0016J\u0012\u0010\u001e\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u001f\u001a\u00020\u0014H\u0016J\u0010\u0010 \u001a\u00020!2\u0006\u0010\u001f\u001a\u00020\u0014H\u0016J$\u0010\"\u001a\u00020#2\u0006\u0010\u001f\u001a\u00020\u00142\b\u0010$\u001a\u0004\u0018\u00010#2\b\u0010%\u001a\u0004\u0018\u00010&H\u0016R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R.\u0010\u0012\u001a\u0016\u0012\u0004\u0012\u00020\u0014\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\r\u0018\u00010\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u0016\"\u0004\b\u0017\u0010\u0018R\"\u0010\u0004\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0019\u0010\u001a\"\u0004\b\u001b\u0010\u001c\u00a8\u0006\'"}, d2 = {"Lcom/ninespartans/xmanager/adapters/ProgramStepItemAdapter;", "Landroid/widget/BaseAdapter;", "context", "Landroid/content/Context;", "programList", "Lio/realm/RealmResults;", "Lcom/ninespartans/xmanager/model/ProgramData;", "(Landroid/content/Context;Lio/realm/RealmResults;)V", "inflater", "Landroid/view/LayoutInflater;", "mContext", "onAddStepItem", "Lkotlin/Function0;", "", "getOnAddStepItem", "()Lkotlin/jvm/functions/Function0;", "setOnAddStepItem", "(Lkotlin/jvm/functions/Function0;)V", "onDeleteStepItem", "Lkotlin/Function2;", "", "getOnDeleteStepItem", "()Lkotlin/jvm/functions/Function2;", "setOnDeleteStepItem", "(Lkotlin/jvm/functions/Function2;)V", "getProgramList", "()Lio/realm/RealmResults;", "setProgramList", "(Lio/realm/RealmResults;)V", "getCount", "getItem", "position", "getItemId", "", "getView", "Landroid/view/View;", "convertView", "viewGroup", "Landroid/view/ViewGroup;", "app_debug"})
public final class ProgramStepItemAdapter extends android.widget.BaseAdapter {
    private final android.content.Context mContext = null;
    private android.view.LayoutInflater inflater;
    @org.jetbrains.annotations.Nullable()
    private io.realm.RealmResults<com.ninespartans.xmanager.model.ProgramData> programList;
    @org.jetbrains.annotations.Nullable()
    private kotlin.jvm.functions.Function2<? super java.lang.Integer, ? super com.ninespartans.xmanager.model.ProgramData, kotlin.Unit> onDeleteStepItem;
    @org.jetbrains.annotations.Nullable()
    private kotlin.jvm.functions.Function0<kotlin.Unit> onAddStepItem;
    
    public ProgramStepItemAdapter(@org.jetbrains.annotations.NotNull()
    android.content.Context context, @org.jetbrains.annotations.Nullable()
    io.realm.RealmResults<com.ninespartans.xmanager.model.ProgramData> programList) {
        super();
    }
    
    @org.jetbrains.annotations.Nullable()
    public final io.realm.RealmResults<com.ninespartans.xmanager.model.ProgramData> getProgramList() {
        return null;
    }
    
    public final void setProgramList(@org.jetbrains.annotations.Nullable()
    io.realm.RealmResults<com.ninespartans.xmanager.model.ProgramData> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function2<java.lang.Integer, com.ninespartans.xmanager.model.ProgramData, kotlin.Unit> getOnDeleteStepItem() {
        return null;
    }
    
    public final void setOnDeleteStepItem(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function2<? super java.lang.Integer, ? super com.ninespartans.xmanager.model.ProgramData, kotlin.Unit> p0) {
    }
    
    @org.jetbrains.annotations.Nullable()
    public final kotlin.jvm.functions.Function0<kotlin.Unit> getOnAddStepItem() {
        return null;
    }
    
    public final void setOnAddStepItem(@org.jetbrains.annotations.Nullable()
    kotlin.jvm.functions.Function0<kotlin.Unit> p0) {
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
    public com.ninespartans.xmanager.model.ProgramData getItem(int position) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public android.view.View getView(int position, @org.jetbrains.annotations.Nullable()
    android.view.View convertView, @org.jetbrains.annotations.Nullable()
    android.view.ViewGroup viewGroup) {
        return null;
    }
}