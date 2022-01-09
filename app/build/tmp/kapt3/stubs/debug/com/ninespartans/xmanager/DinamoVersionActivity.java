package com.ninespartans.xmanager;

import java.lang.System;

@kotlin.Metadata(mv = {1, 5, 1}, k = 1, d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0012\u0010\u0019\u001a\u00020\u001a2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001cH\u0014J\b\u0010\u001d\u001a\u00020\u001aH\u0014J\b\u0010\u001e\u001a\u00020\u001aH\u0014R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u0007\u001a\u00020\b8FX\u0086\u0084\u0002\u00a2\u0006\f\n\u0004\b\u000b\u0010\f\u001a\u0004\b\t\u0010\nR#\u0010\r\u001a\n \u000f*\u0004\u0018\u00010\u000e0\u000e8FX\u0086\u0084\u0002\u00a2\u0006\f\n\u0004\b\u0012\u0010\f\u001a\u0004\b\u0010\u0010\u0011R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0015\u001a\u00020\u0016X\u0086D\u00a2\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018\u00a8\u0006\u001f"}, d2 = {"Lcom/ninespartans/xmanager/DinamoVersionActivity;", "Landroidx/appcompat/app/AppCompatActivity;", "()V", "adapter", "Lcom/ninespartans/xmanager/adapters/DinamoVersionListAdapter;", "binding", "Lcom/ninespartans/xmanager/databinding/ActivityDinamoVersionBinding;", "okClient", "Lokhttp3/OkHttpClient;", "getOkClient", "()Lokhttp3/OkHttpClient;", "okClient$delegate", "Lkotlin/Lazy;", "okRequestList", "Lokhttp3/Request;", "kotlin.jvm.PlatformType", "getOkRequestList", "()Lokhttp3/Request;", "okRequestList$delegate", "onCompleteDownload", "Landroid/content/BroadcastReceiver;", "url", "", "getUrl", "()Ljava/lang/String;", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "onDestroy", "onStart", "app_debug"})
public final class DinamoVersionActivity extends androidx.appcompat.app.AppCompatActivity {
    private com.ninespartans.xmanager.databinding.ActivityDinamoVersionBinding binding;
    private com.ninespartans.xmanager.adapters.DinamoVersionListAdapter adapter;
    @org.jetbrains.annotations.NotNull()
    private final kotlin.Lazy okClient$delegate = null;
    @org.jetbrains.annotations.NotNull()
    private final java.lang.String url = "https://gitlab.com/api/v4/projects/20772874/repository/files/dinamo.json/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR";
    private final kotlin.Lazy okRequestList$delegate = null;
    private final android.content.BroadcastReceiver onCompleteDownload = null;
    
    public DinamoVersionActivity() {
        super();
    }
    
    @org.jetbrains.annotations.NotNull()
    public final okhttp3.OkHttpClient getOkClient() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.String getUrl() {
        return null;
    }
    
    public final okhttp3.Request getOkRequestList() {
        return null;
    }
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    protected void onStart() {
    }
    
    @java.lang.Override()
    protected void onDestroy() {
    }
}