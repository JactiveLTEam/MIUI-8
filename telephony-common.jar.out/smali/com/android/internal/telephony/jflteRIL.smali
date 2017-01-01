.class public Lcom/android/internal/telephony/jflteRIL;
.super Lcom/android/internal/telephony/RIL;
.source "jflteRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# static fields
.field private static final RIL_REQUEST_DIAL_EMERGENCY:I = 0x2711

.field public static final SEND_SMS_TIMEOUT_IN_MS:J = 0x7530L


# instance fields
.field protected isGSM:Z

.field private mAudioManager:Landroid/media/AudioManager;

.field private mIsSendingSMS:Z

.field private mSMSLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkModes"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 71
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/jflteRIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 72
    iget-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mAudioManager:Landroid/media/AudioManager;

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "preferredNetworkType"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 64
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mSMSLock:Ljava/lang/Object;

    .line 65
    iput-boolean v1, p0, Lcom/android/internal/telephony/jflteRIL;->mIsSendingSMS:Z

    .line 66
    iput-boolean v1, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    .line 78
    iget-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mAudioManager:Landroid/media/AudioManager;

    .line 76
    return-void
.end method

.method private dialEmergencyCall(Ljava/lang/String;ILandroid/os/Message;)V
    .locals 4
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "clirMode"    # I
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 631
    const-string/jumbo v1, "RILJ"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Emergency dial: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 633
    const/16 v1, 0x2711

    invoke-static {v1, p3}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 634
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 635
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 636
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 638
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/jflteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 640
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/jflteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 629
    return-void
.end method

.method private operatorCheck(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 429
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 430
    .local v1, "response":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x2

    if-ge v0, v2, :cond_1

    .line 431
    aget-object v2, v1, v0

    if-eqz v2, :cond_0

    .line 432
    aget-object v2, v1, v0

    invoke-static {v2}, Lcom/android/internal/telephony/Operators;->operatorReplace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 430
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 435
    :cond_1
    return-object v1
.end method

.method private responseVoiceDataRegistrationState(Landroid/os/Parcel;Z)Ljava/lang/Object;
    .locals 6
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "data"    # Z

    .prologue
    const/4 v5, 0x3

    .line 440
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 441
    .local v2, "response":[Ljava/lang/String;
    iget-boolean v3, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    if-eqz v3, :cond_1

    .line 442
    if-eqz p2, :cond_0

    .line 443
    array-length v3, v2

    const/4 v4, 0x4

    if-le v3, v4, :cond_0

    .line 444
    const/4 v3, 0x0

    aget-object v3, v2, v3

    const-string/jumbo v4, "1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 442
    if-eqz v3, :cond_0

    .line 445
    aget-object v3, v2, v5

    const-string/jumbo v4, "102"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 442
    if-eqz v3, :cond_0

    .line 446
    const-string/jumbo v3, "2"

    aput-object v3, v2, v5

    .line 448
    :cond_0
    return-object v2

    .line 450
    :cond_1
    array-length v3, v2

    const/16 v4, 0xa

    if-lt v3, v4, :cond_3

    .line 451
    const/4 v1, 0x6

    .local v1, "i":I
    :goto_0
    const/16 v3, 0x9

    if-gt v1, v3, :cond_3

    .line 452
    aget-object v3, v2, v1

    if-nez v3, :cond_2

    .line 453
    const v3, 0x7fffffff

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 451
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 456
    :cond_2
    :try_start_0
    aget-object v3, v2, v1

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 457
    :catch_0
    move-exception v0

    .line 458
    .local v0, "e":Ljava/lang/NumberFormatException;
    aget-object v3, v2, v1

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    goto :goto_1

    .line 464
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v1    # "i":I
    :cond_3
    return-object v2
.end method

.method private setWbAmr(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    .line 473
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 474
    const-string/jumbo v0, "RILJ"

    const-string/jumbo v1, "setWbAmr(): setting audio parameter - wb_amr=on"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    iget-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mAudioManager:Landroid/media/AudioManager;

    const-string/jumbo v1, "wide_voice_enable=true"

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    .line 472
    :cond_0
    :goto_0
    return-void

    .line 476
    :cond_1
    if-nez p1, :cond_0

    .line 477
    const-string/jumbo v0, "RILJ"

    const-string/jumbo v1, "setWbAmr(): setting audio parameter - wb_amr=off"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 478
    iget-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mAudioManager:Landroid/media/AudioManager;

    const-string/jumbo v1, "wide_voice_enable=false"

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private smsLock()V
    .locals 14

    .prologue
    const-wide/16 v12, 0x0

    .line 169
    iget-object v6, p0, Lcom/android/internal/telephony/jflteRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v6

    .line 170
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    const-wide/16 v10, 0x7530

    add-long v2, v8, v10

    .line 171
    .local v2, "timeoutTime":J
    const-wide/16 v4, 0x7530

    .line 172
    .local v4, "waitTimeLeft":J
    :goto_0
    iget-boolean v1, p0, Lcom/android/internal/telephony/jflteRIL;->mIsSendingSMS:Z

    if-eqz v1, :cond_0

    cmp-long v1, v4, v12

    if-lez v1, :cond_0

    .line 173
    const-string/jumbo v1, "RILJ"

    const-string/jumbo v7, "sendSMS() waiting for response of previous SEND_SMS"

    invoke-static {v1, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/telephony/jflteRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v1, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    :goto_1
    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    sub-long v4, v2, v8

    goto :goto_0

    .line 181
    :cond_0
    cmp-long v1, v4, v12

    if-gtz v1, :cond_1

    .line 182
    const-string/jumbo v1, "RILJ"

    const-string/jumbo v7, "sendSms() timed out waiting for response of previous CDMA_SEND_SMS"

    invoke-static {v1, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_1
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/telephony/jflteRIL;->mIsSendingSMS:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v6

    .line 165
    return-void

    .line 169
    .end local v2    # "timeoutTime":J
    .end local v4    # "waitTimeLeft":J
    :catchall_0
    move-exception v1

    monitor-exit v6

    throw v1

    .line 176
    .restart local v2    # "timeoutTime":J
    .restart local v4    # "waitTimeLeft":J
    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/InterruptedException;
    goto :goto_1
.end method


# virtual methods
.method public acceptCall(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 355
    const/16 v1, 0x28

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 357
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 358
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 360
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/jflteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 362
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/jflteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 354
    return-void
.end method

.method public dial(Ljava/lang/String;ILcom/android/internal/telephony/UUSInfo;Landroid/os/Message;)V
    .locals 5
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "clirMode"    # I
    .param p3, "uusInfo"    # Lcom/android/internal/telephony/UUSInfo;
    .param p4, "result"    # Landroid/os/Message;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 556
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 557
    invoke-direct {p0, p1, p2, p4}, Lcom/android/internal/telephony/jflteRIL;->dialEmergencyCall(Ljava/lang/String;ILandroid/os/Message;)V

    .line 558
    return-void

    .line 560
    :cond_0
    const/16 v1, 0xa

    invoke-static {v1, p4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 562
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 563
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 564
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 565
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 566
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 568
    if-nez p3, :cond_1

    .line 569
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 577
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/jflteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 579
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/jflteRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 555
    return-void

    .line 571
    :cond_1
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 572
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 573
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 574
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p3}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0
.end method

.method public getHardwareConfig(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 647
    const-string/jumbo v1, "Ignoring call to \'getHardwareConfig\'"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 648
    if-eqz p1, :cond_0

    .line 649
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 650
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 649
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 651
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v2, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 652
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 646
    .end local v0    # "ex":Lcom/android/internal/telephony/CommandException;
    :cond_0
    return-void
.end method

.method public getImsRegistrationState(Landroid/os/Message;)V
    .locals 4
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 616
    iget v1, p0, Lcom/android/internal/telephony/jflteRIL;->mRilVersion:I

    const/16 v2, 0x8

    if-lt v1, v2, :cond_1

    .line 617
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->getImsRegistrationState(Landroid/os/Message;)V

    .line 615
    :cond_0
    :goto_0
    return-void

    .line 619
    :cond_1
    if-eqz p1, :cond_0

    .line 620
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    .line 621
    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->REQUEST_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    .line 620
    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 622
    .local v0, "ex":Lcom/android/internal/telephony/CommandException;
    invoke-static {p1, v3, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 623
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method

.method public getRadioCapability(Landroid/os/Message;)V
    .locals 3
    .param p1, "response"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x0

    .line 658
    const-string/jumbo v1, "getRadioCapability: returning static radio capability"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 659
    if-eqz p1, :cond_0

    .line 660
    invoke-virtual {p0}, Lcom/android/internal/telephony/jflteRIL;->makeStaticRadioCapability()Lcom/android/internal/telephony/RadioCapability;

    move-result-object v0

    .line 661
    .local v0, "ret":Ljava/lang/Object;
    invoke-static {p1, v0, v2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 662
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 657
    .end local v0    # "ret":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method protected notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V
    .locals 6
    .param p1, "infoRec"    # Lcom/android/internal/telephony/cdma/CdmaInformationRecords;

    .prologue
    const/16 v5, 0x403

    .line 519
    const/16 v0, 0x403

    .line 521
    .local v0, "response":I
    iget-object v2, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    if-eqz v2, :cond_0

    .line 522
    iget-object v1, p1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords;->record:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;

    .line 523
    .local v1, "sir":Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    if-eqz v1, :cond_0

    .line 524
    iget-boolean v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->isPresent:Z

    .line 523
    if-eqz v2, :cond_0

    .line 525
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signalType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_0

    .line 526
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->alertPitch:I

    if-nez v2, :cond_0

    .line 527
    iget v2, v1, Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;->signal:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 529
    const-string/jumbo v2, "RILJ"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Dropping \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v5}, Lcom/android/internal/telephony/jflteRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 530
    invoke-static {v5, v1}, Lcom/android/internal/telephony/jflteRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 529
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 531
    const-string/jumbo v4, "\" to prevent \"ring of death\" bug."

    .line 529
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 532
    return-void

    .line 536
    .end local v1    # "sir":Lcom/android/internal/telephony/cdma/CdmaInformationRecords$CdmaSignalInfoRec;
    :cond_0
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->notifyRegistrantsCdmaInfoRec(Lcom/android/internal/telephony/cdma/CdmaInformationRecords;)V

    .line 518
    return-void
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 12
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    .line 369
    const/4 v2, 0x0

    .line 370
    .local v2, "found":Z
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 371
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 372
    .local v5, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 373
    .local v1, "error":I
    const/4 v4, 0x0

    .line 375
    .local v4, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v9, p0, Lcom/android/internal/telephony/jflteRIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v9

    .line 376
    :try_start_0
    iget-object v8, p0, Lcom/android/internal/telephony/jflteRIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/internal/telephony/RILRequest;

    .line 377
    .local v7, "tr":Lcom/android/internal/telephony/RILRequest;
    if-eqz v7, :cond_1

    iget v8, v7, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    if-ne v8, v5, :cond_1

    .line 378
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-lez v8, :cond_1

    .line 379
    :cond_0
    :try_start_1
    iget v8, v7, Lcom/android/internal/telephony/RILRequest;->mRequest:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    packed-switch v8, :pswitch_data_0

    .end local v4    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_1
    :goto_0
    monitor-exit v9

    .line 397
    if-nez v4, :cond_3

    .line 399
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 401
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v8

    return-object v8

    .line 384
    .restart local v4    # "rr":Lcom/android/internal/telephony/RILRequest;
    :pswitch_0
    move-object v4, v7

    .line 385
    .local v4, "rr":Lcom/android/internal/telephony/RILRequest;
    goto :goto_0

    .line 386
    .local v4, "rr":Lcom/android/internal/telephony/RILRequest;
    :catch_0
    move-exception v6

    .line 388
    .local v6, "thr":Ljava/lang/Throwable;
    :try_start_2
    iget-object v8, v7, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v8, :cond_2

    .line 389
    iget-object v8, v7, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    const/4 v10, 0x0

    invoke-static {v8, v10, v6}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 390
    iget-object v8, v7, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v8}, Landroid/os/Message;->sendToTarget()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    monitor-exit v9

    .line 392
    return-object v7

    .line 375
    .end local v6    # "thr":Ljava/lang/Throwable;
    .end local v7    # "tr":Lcom/android/internal/telephony/RILRequest;
    :catchall_0
    move-exception v8

    monitor-exit v9

    throw v8

    .line 403
    .end local v4    # "rr":Lcom/android/internal/telephony/RILRequest;
    .restart local v7    # "tr":Lcom/android/internal/telephony/RILRequest;
    :cond_3
    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v4

    .line 404
    .local v4, "rr":Lcom/android/internal/telephony/RILRequest;
    if-nez v4, :cond_4

    .line 405
    return-object v4

    .line 407
    :cond_4
    const/4 v3, 0x0

    .line 408
    .local v3, "ret":Ljava/lang/Object;
    if-eqz v1, :cond_5

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v8

    if-lez v8, :cond_6

    .line 409
    :cond_5
    iget v8, v4, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v8, :pswitch_data_1

    .line 414
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Unrecognized solicited response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 410
    :pswitch_1
    invoke-direct {p0, p1, v11}, Lcom/android/internal/telephony/jflteRIL;->responseVoiceDataRegistrationState(Landroid/os/Parcel;Z)Ljava/lang/Object;

    move-result-object v3

    .line 418
    .end local v3    # "ret":Ljava/lang/Object;
    :cond_6
    :goto_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "< "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v4, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v9}, Lcom/android/internal/telephony/jflteRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 419
    const-string/jumbo v9, " "

    .line 418
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 419
    iget v9, v4, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v9, v3}, Lcom/android/internal/telephony/jflteRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 418
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 420
    iget-object v8, v4, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v8, :cond_7

    .line 421
    iget-object v8, v4, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v8, v3, v10}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 422
    iget-object v8, v4, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v8}, Landroid/os/Message;->sendToTarget()V

    .line 424
    :cond_7
    return-object v4

    .line 411
    .restart local v3    # "ret":Ljava/lang/Object;
    :pswitch_2
    const/4 v8, 0x1

    invoke-direct {p0, p1, v8}, Lcom/android/internal/telephony/jflteRIL;->responseVoiceDataRegistrationState(Landroid/os/Parcel;Z)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1

    .line 412
    :pswitch_3
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->operatorCheck(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1

    .line 379
    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 409
    :pswitch_data_1
    .packed-switch 0x14
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 9
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 301
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 302
    .local v1, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 304
    .local v3, "response":I
    sparse-switch v3, :sswitch_data_0

    .line 343
    :goto_0
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 346
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 347
    return-void

    .line 306
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    .line 307
    .local v4, "ret":Ljava/lang/Object;
    invoke-virtual {p0, v8, v7}, Lcom/android/internal/telephony/jflteRIL;->setRadioPower(ZLandroid/os/Message;)V

    .line 308
    iget v5, p0, Lcom/android/internal/telephony/jflteRIL;->mPreferredNetworkType:I

    invoke-virtual {p0, v5, v7}, Lcom/android/internal/telephony/jflteRIL;->setPreferredNetworkType(ILandroid/os/Message;)V

    .line 309
    iget v5, p0, Lcom/android/internal/telephony/jflteRIL;->mCdmaSubscription:I

    invoke-virtual {p0, v5, v7}, Lcom/android/internal/telephony/jflteRIL;->setCdmaSubscriptionSource(ILandroid/os/Message;)V

    .line 310
    iget v5, p0, Lcom/android/internal/telephony/jflteRIL;->mRilVersion:I

    const/16 v6, 0x8

    if-lt v5, v6, :cond_0

    .line 311
    const v5, 0x7fffffff

    invoke-virtual {p0, v5, v7}, Lcom/android/internal/telephony/jflteRIL;->setCellInfoListRate(ILandroid/os/Message;)V

    :cond_0
    move-object v5, v4

    .line 312
    check-cast v5, [I

    aget v5, v5, v8

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->notifyRegistrantsRilConnectionChanged(I)V

    .line 299
    :goto_1
    return-void

    .line 316
    .end local v4    # "ret":Ljava/lang/Object;
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "ret":Ljava/lang/Object;
    move-object v0, v4

    .line 317
    check-cast v0, Ljava/lang/String;

    .line 318
    .local v0, "amString":Ljava/lang/String;
    const-string/jumbo v5, "RILJ"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Executing AM: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "am "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 322
    :catch_0
    move-exception v2

    .line 323
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 324
    const-string/jumbo v5, "RILJ"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "am "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " could not be executed."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 328
    .end local v0    # "amString":Ljava/lang/String;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "ret":Ljava/lang/Object;
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 331
    .end local v4    # "ret":Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 334
    .end local v4    # "ret":Ljava/lang/Object;
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v4

    .restart local v4    # "ret":Ljava/lang/Object;
    move-object v5, v4

    .line 335
    check-cast v5, [I

    aget v5, v5, v8

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->setWbAmr(I)V

    goto :goto_1

    .line 338
    .end local v4    # "ret":Ljava/lang/Object;
    :sswitch_5
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 339
    const/16 v5, 0x413

    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 304
    :sswitch_data_0
    .sparse-switch
        0x40a -> :sswitch_0
        0x40c -> :sswitch_3
        0x2b02 -> :sswitch_1
        0x2b09 -> :sswitch_4
        0x2b0d -> :sswitch_2
        0x2b2f -> :sswitch_5
    .end sparse-switch
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 11
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 222
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 223
    .local v2, "num":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 230
    .local v3, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_8

    .line 231
    new-instance v0, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v0}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 233
    .local v0, "dc":Lcom/android/internal/telephony/DriverCall;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v5

    iput-object v5, v0, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 235
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 236
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_1

    move v5, v6

    :goto_1
    iput-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 237
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_2

    move v5, v6

    :goto_2
    iput-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 238
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 239
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_3

    move v5, v6

    :goto_3
    iput-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 240
    iget-boolean v5, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    if-nez v5, :cond_0

    .line 241
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 242
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 243
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 245
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-eqz v5, :cond_4

    move v5, v6

    :goto_4
    iput-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 246
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 247
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 248
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 249
    iget-boolean v5, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    if-eqz v5, :cond_5

    .line 250
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 253
    :goto_5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    if-ne v5, v6, :cond_6

    .line 254
    new-instance v5, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v5}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v5, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 255
    iget-object v5, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-virtual {v5, v8}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 256
    iget-object v5, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-virtual {v5, v8}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 257
    invoke-virtual {p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v4

    .line 258
    .local v4, "userData":[B
    iget-object v5, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v5, v4}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 259
    const-string/jumbo v5, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    .line 260
    iget-object v9, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v9}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v7

    iget-object v9, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v9}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v6

    .line 261
    iget-object v9, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v9}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v9

    array-length v9, v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x2

    aput-object v9, v8, v10

    .line 259
    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLogv(Ljava/lang/String;)V

    .line 262
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Incoming UUS : data (string)="

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 263
    new-instance v8, Ljava/lang/String;

    iget-object v9, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v9}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/String;-><init>([B)V

    .line 262
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLogv(Ljava/lang/String;)V

    .line 264
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Incoming UUS : data (hex): "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 265
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v8}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v8

    invoke-static {v8}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v8

    .line 264
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLogv(Ljava/lang/String;)V

    .line 271
    .end local v4    # "userData":[B
    :goto_6
    iget-object v5, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v8, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v5, v8}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 273
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 275
    iget-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v5, :cond_7

    .line 276
    iget-object v5, p0, Lcom/android/internal/telephony/jflteRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v5}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 277
    const-string/jumbo v5, "InCall VoicePrivacy is enabled"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 230
    :goto_7
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_1
    move v5, v7

    .line 236
    goto/16 :goto_1

    :cond_2
    move v5, v7

    .line 237
    goto/16 :goto_2

    :cond_3
    move v5, v7

    .line 239
    goto/16 :goto_3

    :cond_4
    move v5, v7

    .line 245
    goto/16 :goto_4

    .line 252
    :cond_5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    iput v5, v0, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    goto/16 :goto_5

    .line 267
    :cond_6
    const-string/jumbo v5, "Incoming UUS : NOT present!"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_6

    .line 279
    :cond_7
    iget-object v5, p0, Lcom/android/internal/telephony/jflteRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v5}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 280
    const-string/jumbo v5, "InCall VoicePrivacy is disabled"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_7

    .line 284
    .end local v0    # "dc":Lcom/android/internal/telephony/DriverCall;
    :cond_8
    invoke-static {v3}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 286
    if-nez v2, :cond_9

    iget-object v5, p0, Lcom/android/internal/telephony/jflteRIL;->mTestingEmergencyCall:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 287
    iget-object v5, p0, Lcom/android/internal/telephony/jflteRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    if-eqz v5, :cond_9

    .line 288
    const-string/jumbo v5, "responseCallList: call ended, testing emergency call, notify ECM Registrants"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/jflteRIL;->riljLog(Ljava/lang/String;)V

    .line 290
    iget-object v5, p0, Lcom/android/internal/telephony/jflteRIL;->mEmergencyCallbackModeRegistrant:Landroid/os/Registrant;

    invoke-virtual {v5}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 294
    :cond_9
    return-object v3
.end method

.method protected responseFailCause(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 6
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v5, 0x0

    .line 671
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 672
    .local v2, "numInts":I
    new-array v3, v2, [I

    .line 673
    .local v3, "response":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 674
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    aput v4, v3, v1

    .line 673
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 676
    :cond_0
    new-instance v0, Lcom/android/internal/telephony/LastCallFailCause;

    invoke-direct {v0}, Lcom/android/internal/telephony/LastCallFailCause;-><init>()V

    .line 677
    .local v0, "failCause":Lcom/android/internal/telephony/LastCallFailCause;
    aget v4, v3, v5

    iput v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->causeCode:I

    .line 678
    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v4

    if-lez v4, :cond_1

    .line 679
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/android/internal/telephony/LastCallFailCause;->vendorCause:Ljava/lang/String;

    .line 681
    :cond_1
    return-object v0
.end method

.method protected responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 11
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 86
    new-instance v3, Lcom/android/internal/telephony/uicc/IccCardStatus;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccCardStatus;-><init>()V

    .line 87
    .local v3, "cardStatus":Lcom/android/internal/telephony/uicc/IccCardStatus;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v3, v6}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setCardState(I)V

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v3, v6}, Lcom/android/internal/telephony/uicc/IccCardStatus;->setUniversalPinState(I)V

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 96
    .local v5, "numApplications":I
    const/16 v6, 0x8

    if-le v5, v6, :cond_0

    .line 97
    const/16 v5, 0x8

    .line 99
    :cond_0
    new-array v6, v5, [Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iput-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .line 101
    new-instance v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v0}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 102
    .local v0, "appStatus":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v5, :cond_2

    .line 103
    if-eqz v4, :cond_1

    .line 104
    new-instance v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .end local v0    # "appStatus":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    invoke-direct {v0}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 106
    .restart local v0    # "appStatus":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    :cond_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 108
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PersoSubstateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 111
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    iput v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->PinStateFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    move-result-object v6

    iput-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 114
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 116
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 117
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 118
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 119
    iget-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    aput-object v0, v6, v4

    .line 102
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 121
    :cond_2
    if-ne v5, v9, :cond_3

    iget-boolean v6, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    if-eqz v6, :cond_4

    .line 148
    :cond_3
    :goto_1
    return-object v3

    .line 121
    :cond_4
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    invoke-virtual {v0, v10}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v7

    if-ne v6, v7, :cond_3

    .line 122
    add-int/lit8 v6, v5, 0x2

    new-array v6, v6, [Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iput-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    .line 123
    iput v8, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    .line 124
    iget-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v7, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mGsmUmtsSubscriptionAppIndex:I

    aput-object v0, v6, v7

    .line 125
    iput v9, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    .line 126
    iput v10, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    .line 127
    new-instance v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v1}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 128
    .local v1, "appStatus2":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v6, 0x4

    invoke-virtual {v1, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v6

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 129
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 130
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 131
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 132
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 133
    iget v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    iput v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 134
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 135
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v6, v1, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 136
    iget-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v7, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mCdmaSubscriptionAppIndex:I

    aput-object v1, v6, v7

    .line 137
    new-instance v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    invoke-direct {v2}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;-><init>()V

    .line 138
    .local v2, "appStatus3":Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;
    const/4 v6, 0x5

    invoke-virtual {v2, v6}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->AppTypeFromRILInt(I)Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    move-result-object v6

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_type:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppType;

    .line 139
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_state:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    .line 140
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->perso_substate:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .line 141
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->aid:Ljava/lang/String;

    .line 142
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->app_label:Ljava/lang/String;

    .line 143
    iget v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    iput v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1_replaced:I

    .line 144
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin1:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 145
    iget-object v6, v0, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    iput-object v6, v2, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;->pin2:Lcom/android/internal/telephony/uicc/IccCardStatus$PinState;

    .line 146
    iget-object v6, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mApplications:[Lcom/android/internal/telephony/uicc/IccCardApplicationStatus;

    iget v7, v3, Lcom/android/internal/telephony/uicc/IccCardStatus;->mImsSubscriptionAppIndex:I

    aput-object v2, v6, v7

    goto :goto_1
.end method

.method protected responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 8
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 587
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/jflteRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 590
    .local v3, "strings":[Ljava/lang/String;
    array-length v5, v3

    iget v6, p0, Lcom/android/internal/telephony/jflteRIL;->mQANElements:I

    rem-int/2addr v5, v6

    if-eqz v5, :cond_0

    .line 591
    new-instance v5, Ljava/lang/RuntimeException;

    .line 592
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "RIL_REQUEST_QUERY_AVAILABLE_NETWORKS: invalid response. Got "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 593
    array-length v7, v3

    .line 592
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 593
    const-string/jumbo v7, " strings, expected multiple of "

    .line 592
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 593
    iget v7, p0, Lcom/android/internal/telephony/jflteRIL;->mQANElements:I

    .line 592
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 591
    invoke-direct {v5, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 596
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    array-length v5, v3

    iget v6, p0, Lcom/android/internal/telephony/jflteRIL;->mQANElements:I

    div-int/2addr v5, v6

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 597
    .local v2, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/OperatorInfo;>;"
    const/4 v1, 0x0

    .line 598
    .local v1, "init":Lcom/android/internal/telephony/Operators;
    array-length v5, v3

    if-eqz v5, :cond_1

    .line 599
    new-instance v1, Lcom/android/internal/telephony/Operators;

    .end local v1    # "init":Lcom/android/internal/telephony/Operators;
    invoke-direct {v1}, Lcom/android/internal/telephony/Operators;-><init>()V

    .line 601
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v5, v3

    if-ge v0, v5, :cond_2

    .line 602
    add-int/lit8 v5, v0, 0x0

    aget-object v5, v3, v5

    invoke-virtual {v1, v5}, Lcom/android/internal/telephony/Operators;->unOptimizedOperatorReplace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 604
    .local v4, "temp":Ljava/lang/String;
    new-instance v5, Lcom/android/internal/telephony/OperatorInfo;

    .line 607
    add-int/lit8 v6, v0, 0x2

    aget-object v6, v3, v6

    .line 608
    add-int/lit8 v7, v0, 0x3

    aget-object v7, v3, v7

    .line 604
    invoke-direct {v5, v4, v4, v6, v7}, Lcom/android/internal/telephony/OperatorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 601
    iget v5, p0, Lcom/android/internal/telephony/jflteRIL;->mQANElements:I

    add-int/2addr v0, v5

    goto :goto_0

    .line 611
    .end local v4    # "temp":Ljava/lang/String;
    :cond_2
    return-object v2
.end method

.method protected responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 545
    iget-object v1, p0, Lcom/android/internal/telephony/jflteRIL;->mSMSLock:Ljava/lang/Object;

    monitor-enter v1

    .line 546
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/jflteRIL;->mIsSendingSMS:Z

    .line 547
    iget-object v0, p0, Lcom/android/internal/telephony/jflteRIL;->mSMSLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 550
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 545
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 18
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 191
    const/16 v16, 0xc

    .line 195
    .local v16, "numInts":I
    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 196
    .local v17, "response":[I
    const/4 v15, 0x0

    .line 191
    .local v15, "i":I
    :goto_0
    const/16 v1, 0xc

    .line 196
    if-ge v15, v1, :cond_0

    .line 197
    invoke-virtual/range {p1 .. p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    aput v1, v17, v15

    .line 196
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 200
    :cond_0
    const/4 v1, 0x0

    aget v2, v17, v1

    and-int/lit16 v2, v2, 0xff

    aput v2, v17, v1

    .line 202
    const/4 v1, 0x2

    aget v2, v17, v1

    rem-int/lit16 v2, v2, 0x100

    aput v2, v17, v1

    .line 203
    const/4 v1, 0x4

    aget v2, v17, v1

    rem-int/lit16 v2, v2, 0x100

    aput v2, v17, v1

    .line 204
    const/4 v1, 0x7

    aget v2, v17, v1

    and-int/lit16 v2, v2, 0xff

    aput v2, v17, v1

    .line 206
    new-instance v1, Landroid/telephony/SignalStrength;

    const/4 v2, 0x0

    aget v2, v17, v2

    const/4 v3, 0x1

    aget v3, v17, v3

    const/4 v4, 0x2

    aget v4, v17, v4

    const/4 v5, 0x3

    aget v5, v17, v5

    const/4 v6, 0x4

    aget v6, v17, v6

    const/4 v7, 0x5

    aget v7, v17, v7

    const/4 v8, 0x6

    aget v8, v17, v8

    const/4 v9, 0x7

    aget v9, v17, v9

    const/16 v10, 0x8

    aget v10, v17, v10

    const/16 v11, 0x9

    aget v11, v17, v11

    const/16 v12, 0xa

    aget v12, v17, v12

    const/16 v13, 0xb

    aget v13, v17, v13

    const/4 v14, 0x1

    invoke-direct/range {v1 .. v14}, Landroid/telephony/SignalStrength;-><init>(IIIIIIIIIIIIZ)V

    return-object v1
.end method

.method public sendCdmaSms([BLandroid/os/Message;)V
    .locals 0
    .param p1, "pdu"    # [B
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 154
    invoke-direct {p0}, Lcom/android/internal/telephony/jflteRIL;->smsLock()V

    .line 155
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->sendCdmaSms([BLandroid/os/Message;)V

    .line 153
    return-void
.end method

.method public sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 0
    .param p1, "smscPDU"    # Ljava/lang/String;
    .param p2, "pdu"    # Ljava/lang/String;
    .param p3, "result"    # Landroid/os/Message;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/android/internal/telephony/jflteRIL;->smsLock()V

    .line 162
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->sendSMS(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 160
    return-void
.end method

.method public setPhoneType(I)V
    .locals 1
    .param p1, "phoneType"    # I

    .prologue
    .line 212
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->setPhoneType(I)V

    .line 213
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/jflteRIL;->isGSM:Z

    .line 211
    return-void

    .line 213
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
