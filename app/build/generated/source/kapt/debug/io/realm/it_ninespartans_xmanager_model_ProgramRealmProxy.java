package io.realm;


import android.annotation.TargetApi;
import android.os.Build;
import android.util.JsonReader;
import android.util.JsonToken;
import io.realm.ImportFlag;
import io.realm.ProxyUtils;
import io.realm.exceptions.RealmMigrationNeededException;
import io.realm.internal.ColumnInfo;
import io.realm.internal.NativeContext;
import io.realm.internal.OsList;
import io.realm.internal.OsMap;
import io.realm.internal.OsObject;
import io.realm.internal.OsObjectSchemaInfo;
import io.realm.internal.OsSchemaInfo;
import io.realm.internal.OsSet;
import io.realm.internal.Property;
import io.realm.internal.RealmObjectProxy;
import io.realm.internal.Row;
import io.realm.internal.Table;
import io.realm.internal.android.JsonUtils;
import io.realm.internal.core.NativeRealmAny;
import io.realm.internal.objectstore.OsObjectBuilder;
import io.realm.log.RealmLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("all")
public class it_ninespartans_xmanager_model_ProgramRealmProxy extends it.ninespartans.xmanager.model.Program
    implements RealmObjectProxy, it_ninespartans_xmanager_model_ProgramRealmProxyInterface {

    static final class ProgramColumnInfo extends ColumnInfo {
        long deviceLedPositionByteColKey;
        long animationByteColKey;
        long durationHoursByteColKey;
        long durationMinutesByteColKey;
        long durationSecondsByteColKey;

        ProgramColumnInfo(OsSchemaInfo schemaInfo) {
            super(5);
            OsObjectSchemaInfo objectSchemaInfo = schemaInfo.getObjectSchemaInfo("Program");
            this.deviceLedPositionByteColKey = addColumnDetails("deviceLedPositionByte", "deviceLedPositionByte", objectSchemaInfo);
            this.animationByteColKey = addColumnDetails("animationByte", "animationByte", objectSchemaInfo);
            this.durationHoursByteColKey = addColumnDetails("durationHoursByte", "durationHoursByte", objectSchemaInfo);
            this.durationMinutesByteColKey = addColumnDetails("durationMinutesByte", "durationMinutesByte", objectSchemaInfo);
            this.durationSecondsByteColKey = addColumnDetails("durationSecondsByte", "durationSecondsByte", objectSchemaInfo);
        }

        ProgramColumnInfo(ColumnInfo src, boolean mutable) {
            super(src, mutable);
            copy(src, this);
        }

        @Override
        protected final ColumnInfo copy(boolean mutable) {
            return new ProgramColumnInfo(this, mutable);
        }

        @Override
        protected final void copy(ColumnInfo rawSrc, ColumnInfo rawDst) {
            final ProgramColumnInfo src = (ProgramColumnInfo) rawSrc;
            final ProgramColumnInfo dst = (ProgramColumnInfo) rawDst;
            dst.deviceLedPositionByteColKey = src.deviceLedPositionByteColKey;
            dst.animationByteColKey = src.animationByteColKey;
            dst.durationHoursByteColKey = src.durationHoursByteColKey;
            dst.durationMinutesByteColKey = src.durationMinutesByteColKey;
            dst.durationSecondsByteColKey = src.durationSecondsByteColKey;
        }
    }

    private static final String NO_ALIAS = "";
    private static final OsObjectSchemaInfo expectedObjectSchemaInfo = createExpectedObjectSchemaInfo();

    private ProgramColumnInfo columnInfo;
    private ProxyState<it.ninespartans.xmanager.model.Program> proxyState;

    it_ninespartans_xmanager_model_ProgramRealmProxy() {
        proxyState.setConstructionFinished();
    }

    @Override
    public void realm$injectObjectContext() {
        if (this.proxyState != null) {
            return;
        }
        final BaseRealm.RealmObjectContext context = BaseRealm.objectContext.get();
        this.columnInfo = (ProgramColumnInfo) context.getColumnInfo();
        this.proxyState = new ProxyState<it.ninespartans.xmanager.model.Program>(this);
        proxyState.setRealm$realm(context.getRealm());
        proxyState.setRow$realm(context.getRow());
        proxyState.setAcceptDefaultValue$realm(context.getAcceptDefaultValue());
        proxyState.setExcludeFields$realm(context.getExcludeFields());
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$deviceLedPositionByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.deviceLedPositionByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.deviceLedPositionByteColKey);
    }

    @Override
    public void realmSet$deviceLedPositionByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.deviceLedPositionByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.deviceLedPositionByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.deviceLedPositionByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.deviceLedPositionByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$animationByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.animationByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.animationByteColKey);
    }

    @Override
    public void realmSet$animationByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.animationByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.animationByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.animationByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.animationByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationHoursByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationHoursByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationHoursByteColKey);
    }

    @Override
    public void realmSet$durationHoursByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationHoursByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationHoursByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationHoursByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationHoursByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationMinutesByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationMinutesByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationMinutesByteColKey);
    }

    @Override
    public void realmSet$durationMinutesByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationMinutesByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationMinutesByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationMinutesByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationMinutesByteColKey, value);
    }

    @Override
    @SuppressWarnings("cast")
    public Byte realmGet$durationSecondsByte() {
        proxyState.getRealm$realm().checkIfValid();
        if (proxyState.getRow$realm().isNull(columnInfo.durationSecondsByteColKey)) {
            return null;
        }
        return (byte) proxyState.getRow$realm().getLong(columnInfo.durationSecondsByteColKey);
    }

    @Override
    public void realmSet$durationSecondsByte(Byte value) {
        if (proxyState.isUnderConstruction()) {
            if (!proxyState.getAcceptDefaultValue$realm()) {
                return;
            }
            final Row row = proxyState.getRow$realm();
            if (value == null) {
                row.getTable().setNull(columnInfo.durationSecondsByteColKey, row.getObjectKey(), true);
                return;
            }
            row.getTable().setLong(columnInfo.durationSecondsByteColKey, row.getObjectKey(), value, true);
            return;
        }

        proxyState.getRealm$realm().checkIfValid();
        if (value == null) {
            proxyState.getRow$realm().setNull(columnInfo.durationSecondsByteColKey);
            return;
        }
        proxyState.getRow$realm().setLong(columnInfo.durationSecondsByteColKey, value);
    }

    private static OsObjectSchemaInfo createExpectedObjectSchemaInfo() {
        OsObjectSchemaInfo.Builder builder = new OsObjectSchemaInfo.Builder(NO_ALIAS, "Program", true, 5, 0);
        builder.addPersistedProperty(NO_ALIAS, "deviceLedPositionByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "animationByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationHoursByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationMinutesByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        builder.addPersistedProperty(NO_ALIAS, "durationSecondsByte", RealmFieldType.INTEGER, !Property.PRIMARY_KEY, !Property.INDEXED, !Property.REQUIRED);
        return builder.build();
    }

    public static OsObjectSchemaInfo getExpectedObjectSchemaInfo() {
        return expectedObjectSchemaInfo;
    }

    public static ProgramColumnInfo createColumnInfo(OsSchemaInfo schemaInfo) {
        return new ProgramColumnInfo(schemaInfo);
    }

    public static String getSimpleClassName() {
        return "Program";
    }

    public static final class ClassNameHelper {
        public static final String INTERNAL_CLASS_NAME = "Program";
    }

    @SuppressWarnings("cast")
    public static it.ninespartans.xmanager.model.Program createOrUpdateEmbeddedUsingJsonObject(Realm realm, RealmModel parent, String parentProperty, JSONObject json, boolean update)
        throws JSONException {
        final List<String> excludeFields = Collections.<String> emptyList();
        it.ninespartans.xmanager.model.Program obj = realm.createEmbeddedObject(it.ninespartans.xmanager.model.Program.class, parent, parentProperty);

        final it_ninespartans_xmanager_model_ProgramRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) obj;
        if (json.has("deviceLedPositionByte")) {
            if (json.isNull("deviceLedPositionByte")) {
                objProxy.realmSet$deviceLedPositionByte(null);
            } else {
                objProxy.realmSet$deviceLedPositionByte((byte) json.getInt("deviceLedPositionByte"));
            }
        }
        if (json.has("animationByte")) {
            if (json.isNull("animationByte")) {
                objProxy.realmSet$animationByte(null);
            } else {
                objProxy.realmSet$animationByte((byte) json.getInt("animationByte"));
            }
        }
        if (json.has("durationHoursByte")) {
            if (json.isNull("durationHoursByte")) {
                objProxy.realmSet$durationHoursByte(null);
            } else {
                objProxy.realmSet$durationHoursByte((byte) json.getInt("durationHoursByte"));
            }
        }
        if (json.has("durationMinutesByte")) {
            if (json.isNull("durationMinutesByte")) {
                objProxy.realmSet$durationMinutesByte(null);
            } else {
                objProxy.realmSet$durationMinutesByte((byte) json.getInt("durationMinutesByte"));
            }
        }
        if (json.has("durationSecondsByte")) {
            if (json.isNull("durationSecondsByte")) {
                objProxy.realmSet$durationSecondsByte(null);
            } else {
                objProxy.realmSet$durationSecondsByte((byte) json.getInt("durationSecondsByte"));
            }
        }
        return obj;
    }

    @SuppressWarnings("cast")
    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    public static it.ninespartans.xmanager.model.Program createUsingJsonStream(Realm realm, JsonReader reader)
        throws IOException {
        final it.ninespartans.xmanager.model.Program obj = new it.ninespartans.xmanager.model.Program();
        final it_ninespartans_xmanager_model_ProgramRealmProxyInterface objProxy = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) obj;
        reader.beginObject();
        while (reader.hasNext()) {
            String name = reader.nextName();
            if (false) {
            } else if (name.equals("deviceLedPositionByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$deviceLedPositionByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$deviceLedPositionByte(null);
                }
            } else if (name.equals("animationByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$animationByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$animationByte(null);
                }
            } else if (name.equals("durationHoursByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationHoursByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationHoursByte(null);
                }
            } else if (name.equals("durationMinutesByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationMinutesByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationMinutesByte(null);
                }
            } else if (name.equals("durationSecondsByte")) {
                if (reader.peek() != JsonToken.NULL) {
                    objProxy.realmSet$durationSecondsByte((byte) reader.nextInt());
                } else {
                    reader.skipValue();
                    objProxy.realmSet$durationSecondsByte(null);
                }
            } else {
                reader.skipValue();
            }
        }
        reader.endObject();
        return obj;
    }

    static it_ninespartans_xmanager_model_ProgramRealmProxy newProxyInstance(BaseRealm realm, Row row) {
        // Ignore default values to avoid creating unexpected objects from RealmModel/RealmList fields
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        objectContext.set(realm, row, realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class), false, Collections.<String>emptyList());
        io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy obj = new io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy();
        objectContext.clear();
        return obj;
    }

    public static it.ninespartans.xmanager.model.Program copyOrUpdate(Realm realm, ProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.Program object, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null) {
            final BaseRealm otherRealm = ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm();
            if (otherRealm.threadId != realm.threadId) {
                throw new IllegalArgumentException("Objects which belong to Realm instances in other threads cannot be copied into this Realm instance.");
            }
            if (otherRealm.getPath().equals(realm.getPath())) {
                return object;
            }
        }
        final BaseRealm.RealmObjectContext objectContext = BaseRealm.objectContext.get();
        RealmObjectProxy cachedRealmObject = cache.get(object);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Program) cachedRealmObject;
        }

        return copy(realm, columnInfo, object, update, cache, flags);
    }

    public static it.ninespartans.xmanager.model.Program copy(Realm realm, ProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.Program newObject, boolean update, Map<RealmModel,RealmObjectProxy> cache, Set<ImportFlag> flags) {
        RealmObjectProxy cachedRealmObject = cache.get(newObject);
        if (cachedRealmObject != null) {
            return (it.ninespartans.xmanager.model.Program) cachedRealmObject;
        }

        it_ninespartans_xmanager_model_ProgramRealmProxyInterface unmanagedSource = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) newObject;

        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);

        // Add all non-"object reference" fields
        builder.addInteger(columnInfo.deviceLedPositionByteColKey, unmanagedSource.realmGet$deviceLedPositionByte());
        builder.addInteger(columnInfo.animationByteColKey, unmanagedSource.realmGet$animationByte());
        builder.addInteger(columnInfo.durationHoursByteColKey, unmanagedSource.realmGet$durationHoursByte());
        builder.addInteger(columnInfo.durationMinutesByteColKey, unmanagedSource.realmGet$durationMinutesByte());
        builder.addInteger(columnInfo.durationSecondsByteColKey, unmanagedSource.realmGet$durationSecondsByte());

        // Create the underlying object and cache it before setting any object/objectlist references
        // This will allow us to break any circular dependencies by using the object cache.
        Row row = builder.createNewObject();
        io.realm.it_ninespartans_xmanager_model_ProgramRealmProxy managedCopy = newProxyInstance(realm, row);
        cache.put(newObject, managedCopy);

        return managedCopy;
    }

    public static long insert(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, it.ninespartans.xmanager.model.Program object, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        long tableNativePtr = table.getNativePtr();
        ProgramColumnInfo columnInfo = (ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class);
        long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
        cache.put(object, objKey);
        Number realmGet$deviceLedPositionByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$deviceLedPositionByte();
        if (realmGet$deviceLedPositionByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
        }
        Number realmGet$animationByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$animationByte();
        if (realmGet$animationByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
        }
        Number realmGet$durationHoursByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationHoursByte();
        if (realmGet$durationHoursByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
        }
        Number realmGet$durationMinutesByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationMinutesByte();
        if (realmGet$durationMinutesByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
        }
        Number realmGet$durationSecondsByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationSecondsByte();
        if (realmGet$durationSecondsByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
        }
        return objKey;
    }

    public static void insert(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        long tableNativePtr = table.getNativePtr();
        ProgramColumnInfo columnInfo = (ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class);
        it.ninespartans.xmanager.model.Program object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Program) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
            cache.put(object, objKey);
            Number realmGet$deviceLedPositionByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$deviceLedPositionByte();
            if (realmGet$deviceLedPositionByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
            }
            Number realmGet$animationByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$animationByte();
            if (realmGet$animationByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
            }
            Number realmGet$durationHoursByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationHoursByte();
            if (realmGet$durationHoursByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
            }
            Number realmGet$durationMinutesByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationMinutesByte();
            if (realmGet$durationMinutesByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
            }
            Number realmGet$durationSecondsByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationSecondsByte();
            if (realmGet$durationSecondsByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
            }
        }
    }

    public static long insertOrUpdate(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, it.ninespartans.xmanager.model.Program object, Map<RealmModel,Long> cache) {
        if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
            return ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey();
        }
        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        long tableNativePtr = table.getNativePtr();
        ProgramColumnInfo columnInfo = (ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class);
        long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
        cache.put(object, objKey);
        Number realmGet$deviceLedPositionByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$deviceLedPositionByte();
        if (realmGet$deviceLedPositionByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, false);
        }
        Number realmGet$animationByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$animationByte();
        if (realmGet$animationByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.animationByteColKey, objKey, false);
        }
        Number realmGet$durationHoursByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationHoursByte();
        if (realmGet$durationHoursByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, false);
        }
        Number realmGet$durationMinutesByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationMinutesByte();
        if (realmGet$durationMinutesByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, false);
        }
        Number realmGet$durationSecondsByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationSecondsByte();
        if (realmGet$durationSecondsByte != null) {
            Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
        } else {
            Table.nativeSetNull(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, false);
        }
        return objKey;
    }

    public static void insertOrUpdate(Realm realm, Table parentObjectTable, long parentColumnKey, long parentObjectKey, Iterator<? extends RealmModel> objects, Map<RealmModel,Long> cache) {
        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        long tableNativePtr = table.getNativePtr();
        ProgramColumnInfo columnInfo = (ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class);
        it.ninespartans.xmanager.model.Program object = null;
        while (objects.hasNext()) {
            object = (it.ninespartans.xmanager.model.Program) objects.next();
            if (cache.containsKey(object)) {
                continue;
            }
            if (object instanceof RealmObjectProxy && !RealmObject.isFrozen(object) && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm() != null && ((RealmObjectProxy) object).realmGet$proxyState().getRealm$realm().getPath().equals(realm.getPath())) {
                cache.put(object, ((RealmObjectProxy) object).realmGet$proxyState().getRow$realm().getObjectKey());
                continue;
            }
            long objKey = OsObject.createEmbeddedObject(parentObjectTable, parentObjectKey, parentColumnKey);
            cache.put(object, objKey);
            Number realmGet$deviceLedPositionByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$deviceLedPositionByte();
            if (realmGet$deviceLedPositionByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, realmGet$deviceLedPositionByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.deviceLedPositionByteColKey, objKey, false);
            }
            Number realmGet$animationByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$animationByte();
            if (realmGet$animationByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.animationByteColKey, objKey, realmGet$animationByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.animationByteColKey, objKey, false);
            }
            Number realmGet$durationHoursByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationHoursByte();
            if (realmGet$durationHoursByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, realmGet$durationHoursByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationHoursByteColKey, objKey, false);
            }
            Number realmGet$durationMinutesByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationMinutesByte();
            if (realmGet$durationMinutesByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, realmGet$durationMinutesByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationMinutesByteColKey, objKey, false);
            }
            Number realmGet$durationSecondsByte = ((it_ninespartans_xmanager_model_ProgramRealmProxyInterface) object).realmGet$durationSecondsByte();
            if (realmGet$durationSecondsByte != null) {
                Table.nativeSetLong(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, realmGet$durationSecondsByte.longValue(), false);
            } else {
                Table.nativeSetNull(tableNativePtr, columnInfo.durationSecondsByteColKey, objKey, false);
            }
        }
    }

    public static it.ninespartans.xmanager.model.Program createDetachedCopy(it.ninespartans.xmanager.model.Program realmObject, int currentDepth, int maxDepth, Map<RealmModel, CacheData<RealmModel>> cache) {
        if (currentDepth > maxDepth || realmObject == null) {
            return null;
        }
        CacheData<RealmModel> cachedObject = cache.get(realmObject);
        it.ninespartans.xmanager.model.Program unmanagedObject;
        if (cachedObject == null) {
            unmanagedObject = new it.ninespartans.xmanager.model.Program();
            cache.put(realmObject, new RealmObjectProxy.CacheData<RealmModel>(currentDepth, unmanagedObject));
        } else {
            // Reuse cached object or recreate it because it was encountered at a lower depth.
            if (currentDepth >= cachedObject.minDepth) {
                return (it.ninespartans.xmanager.model.Program) cachedObject.object;
            }
            unmanagedObject = (it.ninespartans.xmanager.model.Program) cachedObject.object;
            cachedObject.minDepth = currentDepth;
        }
        it_ninespartans_xmanager_model_ProgramRealmProxyInterface unmanagedCopy = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) unmanagedObject;
        it_ninespartans_xmanager_model_ProgramRealmProxyInterface realmSource = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) realmObject;
        Realm objectRealm = (Realm) ((RealmObjectProxy) realmObject).realmGet$proxyState().getRealm$realm();
        unmanagedCopy.realmSet$deviceLedPositionByte(realmSource.realmGet$deviceLedPositionByte());
        unmanagedCopy.realmSet$animationByte(realmSource.realmGet$animationByte());
        unmanagedCopy.realmSet$durationHoursByte(realmSource.realmGet$durationHoursByte());
        unmanagedCopy.realmSet$durationMinutesByte(realmSource.realmGet$durationMinutesByte());
        unmanagedCopy.realmSet$durationSecondsByte(realmSource.realmGet$durationSecondsByte());

        return unmanagedObject;
    }

    static it.ninespartans.xmanager.model.Program update(Realm realm, ProgramColumnInfo columnInfo, it.ninespartans.xmanager.model.Program realmObject, it.ninespartans.xmanager.model.Program newObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        it_ninespartans_xmanager_model_ProgramRealmProxyInterface realmObjectTarget = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) realmObject;
        it_ninespartans_xmanager_model_ProgramRealmProxyInterface realmObjectSource = (it_ninespartans_xmanager_model_ProgramRealmProxyInterface) newObject;
        Table table = realm.getTable(it.ninespartans.xmanager.model.Program.class);
        OsObjectBuilder builder = new OsObjectBuilder(table, flags);
        builder.addInteger(columnInfo.deviceLedPositionByteColKey, realmObjectSource.realmGet$deviceLedPositionByte());
        builder.addInteger(columnInfo.animationByteColKey, realmObjectSource.realmGet$animationByte());
        builder.addInteger(columnInfo.durationHoursByteColKey, realmObjectSource.realmGet$durationHoursByte());
        builder.addInteger(columnInfo.durationMinutesByteColKey, realmObjectSource.realmGet$durationMinutesByte());
        builder.addInteger(columnInfo.durationSecondsByteColKey, realmObjectSource.realmGet$durationSecondsByte());

        builder.updateExistingEmbeddedObject((RealmObjectProxy) realmObject);
        return realmObject;
    }

    public static void updateEmbeddedObject(Realm realm, it.ninespartans.xmanager.model.Program unmanagedObject, it.ninespartans.xmanager.model.Program managedObject, Map<RealmModel, RealmObjectProxy> cache, Set<ImportFlag> flags) {
        update(realm, (it_ninespartans_xmanager_model_ProgramRealmProxy.ProgramColumnInfo) realm.getSchema().getColumnInfo(it.ninespartans.xmanager.model.Program.class), managedObject, unmanagedObject, cache, flags);
    }

    @Override
    @SuppressWarnings("ArrayToString")
    public String toString() {
        if (!RealmObject.isValid(this)) {
            return "Invalid object";
        }
        StringBuilder stringBuilder = new StringBuilder("Program = proxy[");
        stringBuilder.append("{deviceLedPositionByte:");
        stringBuilder.append(realmGet$deviceLedPositionByte() != null ? realmGet$deviceLedPositionByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{animationByte:");
        stringBuilder.append(realmGet$animationByte() != null ? realmGet$animationByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationHoursByte:");
        stringBuilder.append(realmGet$durationHoursByte() != null ? realmGet$durationHoursByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationMinutesByte:");
        stringBuilder.append(realmGet$durationMinutesByte() != null ? realmGet$durationMinutesByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append(",");
        stringBuilder.append("{durationSecondsByte:");
        stringBuilder.append(realmGet$durationSecondsByte() != null ? realmGet$durationSecondsByte() : "null");
        stringBuilder.append("}");
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public ProxyState<?> realmGet$proxyState() {
        return proxyState;
    }

    @Override
    public int hashCode() {
        String realmName = proxyState.getRealm$realm().getPath();
        String tableName = proxyState.getRow$realm().getTable().getName();
        long objKey = proxyState.getRow$realm().getObjectKey();

        int result = 17;
        result = 31 * result + ((realmName != null) ? realmName.hashCode() : 0);
        result = 31 * result + ((tableName != null) ? tableName.hashCode() : 0);
        result = 31 * result + (int) (objKey ^ (objKey >>> 32));
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        it_ninespartans_xmanager_model_ProgramRealmProxy aProgram = (it_ninespartans_xmanager_model_ProgramRealmProxy)o;

        BaseRealm realm = proxyState.getRealm$realm();
        BaseRealm otherRealm = aProgram.proxyState.getRealm$realm();
        String path = realm.getPath();
        String otherPath = otherRealm.getPath();
        if (path != null ? !path.equals(otherPath) : otherPath != null) return false;
        if (realm.isFrozen() != otherRealm.isFrozen()) return false;
        if (!realm.sharedRealm.getVersionID().equals(otherRealm.sharedRealm.getVersionID())) {
            return false;
        }

        String tableName = proxyState.getRow$realm().getTable().getName();
        String otherTableName = aProgram.proxyState.getRow$realm().getTable().getName();
        if (tableName != null ? !tableName.equals(otherTableName) : otherTableName != null) return false;

        if (proxyState.getRow$realm().getObjectKey() != aProgram.proxyState.getRow$realm().getObjectKey()) return false;

        return true;
    }
}
